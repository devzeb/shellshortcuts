#!/bin/bash

# check if first argument is supplied
if [ -z "$1" ]
then
    echo "No comment for what this key should be used is supplied" >&2
    echo "Usage: create-ssh-key.sh <comment> [keyfile]" >&2
    exit 1
fi

# if second argument is supplied, use it as the path to the key file

if [ -z "$2" ]
then
    ssh-keygen -t ed25519 -a 420 -C "$1"
else
    ssh-keygen -t ed25519 -a 420 -C "$1" -f "$HOME/.ssh/id_ed25519-$2"
fi
