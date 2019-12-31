#!/usr/bin/env bash

commit_regex='\[[A-Z]+-[0-9]{1,3}\]'
commit_msg="Aborting commit. Your commit message does not contain your Task number."

if ! grep -iqE "$commit_regex" "$1"; then
    echo "$commit_msg" >&2
    exit 1
fi

time_regex=' - [0-9]{1,2}[m,h]'
time_msg="Aborting commit. Your commit message does not contain time tracking."

if ! grep -iqE "$time_regex" "$1"; then
    echo "$time_msg" >&2
    exit 1
fi
