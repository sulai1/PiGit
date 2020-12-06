#!/bin/bash

OPTS=`getopt -o u:r:d --long user,remote,debug: -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

USER=''
REMOTE=''
NAME=''
DEBUG=''

while true; do
	case "$1" in
		-u | --user )	   USER="$2"; shift; shift ;;
		-r | --remote )	REMOTE="$2"; shift; shift ;;
		-d | --debug )		DEBUG='--diff --check'; shift;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

echo USER=$USER
echo REMOTE=$REMOTE
echo DEBUG=$DEBUG

echo path $ANSIBLE_PATH


dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp "$dir/inventory" "$dir/inventory.tmp"
echo "$REMOTE" >> "$dir/inventory.tmp"

ansible-playbook -i "$dir/inventory.tmp" -u "$USER" -K "$dir/new_server.yml"

rm "$dir/inventory.tmp"

