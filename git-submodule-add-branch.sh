#!/bin/bash

# check if current directory is a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
    echo "Current directory is not a git repository" >&2
    exit 1
fi

# check if argument 1 is supplied
if [ -z "$1" ]
then
    echo "Usage: $0 <git_repository_url> <branch-name>" >&2
    exit 1
fi

# check if argument 2 is supplied
if [ -z "$2" ]
then
    echo "Usage: $0 <git_repository_url> <branch-name>" >&2
    exit 1
fi

git submodule add -b $2 --depth 1 $1 
