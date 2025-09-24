# Arch Linux Notes

## Web App (PWA)

For the `webapp-install` script to work there needs to be a directory
for the icons to be installed to. It can be done with the following command:

```bash
mkdir -p ~/.local/share/applications/icons
```

## Monitor Lid Events

In order to monitor lid events, the user needs to be
added to the `input` group.

```bash
sudo usermod -aG input $USER
```
