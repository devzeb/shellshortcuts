#!/bin/bash

# check if $1 is supplied

if [ -z "$1" ]
then
    echo "No group name supplied" >&2
    echo "Usage: $0 <groupname> <username1> [username2] [username3] ..." >&2
    exit 1
fi

# if no users are supplied, exit

if [ -z "$2" ]
then
    echo "No users supplied" >&2
    echo "Usage: $0 <groupname> <username1> [username2] [username3] ..." >&2
    exit 1
fi

# if group does not exist, exit

if ! grep -q "^$1:" /etc/group
then
    echo "Group $1 does not exist" >&2
    exit 1
fi

groupname=$1

# parse usernames from $2-... to array

usernames=("${@:2}")

# check if users exist

for username in "${usernames[@]}"
do
    if ! id -u "$username" &> /dev/null
    then
        echo "User $username does not exist" >&2
        exit 1
    fi
done

# add users to group

for username in "${usernames[@]}"
do
    usermod -a -G "$groupname" "$username"
done
