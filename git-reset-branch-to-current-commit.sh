#!/bin/bash

# check if current directory is a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
    echo "Current directory is not a git repository" >&2
    exit 1
fi

# check if $1 is not empty
if [ -z "$1" ]
then
    echo "Usage: $0 <branch-name>" >&2
    exit 1
fi

# check if $1 is a valid branch name
if ! git branch | grep -q "$1"
then
    echo "$1 is not a valid branch name for this repository" >&2
    echo "Valid branch names are:" >&2
    git branch
    exit 1
fi


git checkout -B $1