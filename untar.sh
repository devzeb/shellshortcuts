#!/bin/bash

# check if argument 1 is a vaild file
if [ ! -f "$1" ]; then
    echo "Error: $1 is not a valid file" >&2
    echo "Usage: $0 <filename>" >&2
    exit 1
fi

# untar the file
tar --extract --verbose --file="$1"