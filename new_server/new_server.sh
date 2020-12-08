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

dir=$(dirname $(readlink -f "$0"))
echo $dir
echo USER=$USER
echo REMOTE=$REMOTE
echo DEBUG=$DEBUG

ansible-playbook --extra-vars "variable_host=$REMOTE" -u "$USER" -K "$dir/new_server.yml"

