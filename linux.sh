#!/bin/sh
printf '\033c\033]0;%s\a' 8th grade project
base_path="$(dirname "$(realpath "$0")")"
"$base_path/linux.x86_64" "$@"
