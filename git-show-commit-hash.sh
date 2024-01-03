#!/bin/bash

# check if current directory is a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
    echo "Current directory is not a git repository" >&2
    exit 1
fi

git rev-parse HEAD