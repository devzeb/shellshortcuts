#!/bin/bash

# check if $1 is supplied

if [ -z "$1" ]
then
    echo "No group name supplied" >&2
    echo "Usage: $0 <group name> [username1] [username2]" >&2
    exit 1
fi

# check if group already exists
if grep -q "^$1:" /etc/group
then
    echo "Group $1 already exists" >&2
    exit 1
fi


usernames=("${@:2}")

# check if all users exist
for username in "${usernames[@]}"
do
    if ! id -u "$username" &> /dev/null
    then
        echo "User $username does not exist" >&2
        exit 1 
    fi
done

# create group
groupadd "$1"

# add users to group
for username in "${@:2}"
do
    usermod -a -G "$1" "$username"
done