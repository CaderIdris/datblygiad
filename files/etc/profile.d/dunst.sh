#!/bin/bash

# Check whether dunst is running
dunstctl is-paused > /dev/null 2>&1

# If not running, start it
dunstctl_status=$?
[ $dunstctl_status -ne 0 ] && (dunst > /dev/null 2>&1 &)
