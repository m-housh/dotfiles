import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import type { AutocompleteItem } from "@earendil-works/pi-tui";
import { resolve } from "node:path";

function words(args: string): string[] {
	return args.trim().split(/\s+/).filter(Boolean);
}

function details(stdout: string, stderr: string, code: number): string {
	const output = [stdout.trim(), stderr.trim()].filter(Boolean).join("\n");
	return output || `herdr-flow exited with code ${code}`;
}

function shellQuote(value: string): string {
	return `'${value.replaceAll("'", `'"'"'`)}'`;
}

export default function herdrFlowExtension(pi: ExtensionAPI): void {
	let branches: string[] = [];

	pi.on("session_start", async (_event, ctx) => {
		const result = await pi.exec("git", ["for-each-ref", "--format=%(refname:short)", "refs/heads"], {
			cwd: ctx.cwd,
			timeout: 5_000,
		});
		branches = result.code === 0 ? result.stdout.split("\n").filter(Boolean) : [];
	});

	const completeBranch = (prefix: string): AutocompleteItem[] | null => {
		const token = prefix.split(/\s+/).at(-1) ?? "";
		const matches = branches.filter((branch) => branch.startsWith(token));
		return matches.length > 0 ? matches.map((branch) => ({ value: branch, label: branch })) : null;
	};

	pi.registerCommand("implement", {
		description: "Start an approved plan in a new worktree and Herdr workspace",
		getArgumentCompletions: completeBranch,
		handler: async (args, ctx) => {
			if (!ctx.hasUI) {
				ctx.ui.notify("/implement requires interactive UI", "error");
				return;
			}
			const parsed = words(args);
			if (parsed.length < 1 || parsed.length > 2) {
				ctx.ui.notify("Usage: /implement <branch> [base]", "error");
				return;
			}
			const [branch, suppliedBase] = parsed;
			const base = suppliedBase ?? "main";
			const enteredPlan = await ctx.ui.input("Approved plan path", "PLAN.md or another explicit path");
			if (!enteredPlan?.trim()) {
				ctx.ui.notify("Implementation cancelled", "info");
				return;
			}
			const planPath = resolve(ctx.cwd, enteredPlan.trim());
			const confirmed = await ctx.ui.confirm(
				"Start implementation?",
				`Branch: ${branch}\nBase: ${base}\nPlan: ${planPath}`,
			);
			if (!confirmed) {
				ctx.ui.notify("Implementation cancelled", "info");
				return;
			}

			const commandArgs = ["implement", "--plan", planPath, branch];
			if (suppliedBase) commandArgs.push(base);
			const result = await pi.exec("herdr-flow", commandArgs, { cwd: ctx.cwd, timeout: 300_000 });
			if (result.code !== 0) {
				ctx.ui.notify(details(result.stdout, result.stderr, result.code), "error");
				return;
			}
			ctx.ui.notify(`Implementation started\n${result.stdout.trim()}`, "info");
		},
	});

	pi.registerCommand("cleanup", {
		description: "Clean up an explicitly confirmed merged task from main",
		getArgumentCompletions: completeBranch,
		handler: async (args, ctx) => {
			if (!ctx.hasUI) {
				ctx.ui.notify("/cleanup requires interactive UI", "error");
				return;
			}
			const parsed = words(args);
			if (parsed.length !== 1) {
				ctx.ui.notify("Usage: /cleanup <branch>", "error");
				return;
			}
			const branch = parsed[0];
			const common = await pi.exec("git", ["rev-parse", "--path-format=absolute", "--git-common-dir"], {
				cwd: ctx.cwd,
				timeout: 5_000,
			});
			const top = await pi.exec("git", ["rev-parse", "--show-toplevel"], { cwd: ctx.cwd, timeout: 5_000 });
			const commonPath = common.stdout.trim();
			const mainRoot = common.code === 0 && commonPath.endsWith("/.git") ? commonPath.slice(0, -5) : undefined;
			if (!mainRoot || top.code !== 0) {
				ctx.ui.notify("Could not resolve the main worktree", "error");
				return;
			}
			if (resolve(top.stdout.trim()) !== resolve(mainRoot)) {
				ctx.ui.notify(
					`No cleanup was run from this linked worktree. Run later from main:\ncd -- ${shellQuote(mainRoot)}\nherdr-flow cleanup --preview ${shellQuote(branch)}\nherdr-flow cleanup --merged ${shellQuote(branch)}`,
					"warning",
				);
				return;
			}

			const preview = await pi.exec("herdr-flow", ["cleanup", "--preview", branch], {
				cwd: mainRoot,
				timeout: 10_000,
			});
			if (preview.code !== 0) {
				ctx.ui.notify(details(preview.stdout, preview.stderr, preview.code), "error");
				return;
			}
			const confirmed = await ctx.ui.confirm(
				"Confirm merged task cleanup",
				`${preview.stdout.trim()}\n\nConfirm that '${branch}' was merged and perform these destructive actions?`,
			);
			if (!confirmed) {
				ctx.ui.notify("Cleanup cancelled", "info");
				return;
			}
			const result = await pi.exec("herdr-flow", ["cleanup", "--merged", branch], {
				cwd: mainRoot,
				timeout: 300_000,
			});
			if (result.code !== 0) {
				ctx.ui.notify(details(result.stdout, result.stderr, result.code), "error");
				return;
			}
			ctx.ui.notify(result.stdout.trim(), "info");
		},
	});
}
