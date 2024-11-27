#!/usr/bin/env zsh

zparseopts -D -E -F - \
  g=generateFlag -generate=generateFlag \
  s=setFlag -set=setFlag \
  -vault-id:=vaultId \
  || exit 1

function generate_pass() {
  gopass generate "ansible/$1" 24
}

if [ ${#vaultId} = 2 ]; then
  gopass show -o "${vaultId[-1]}"
elif [ ${#setFlag} = 1 ]; then
  # Use the first argument as the id, ask for an id
  # if not supplied.
  local id=$1
  if [ "$id" = "" ]; then
    read -r id\?"Ansible ID: "
  fi

  # Check for generate flag to automatically generate a password.
  [ ${#generateFlag} = 1 ] \
    && gopass generate "ansible/$id" 24 \
    && exit 0

  # Insert a password prompting the user to supply it.
  gopass insert "ansible/$id"
fi
