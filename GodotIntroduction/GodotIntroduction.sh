#!/bin/sh
printf '\033c\033]0;%s\a' GodotIntroduction
base_path="$(dirname "$(realpath "$0")")"
"$base_path/GodotIntroduction.x86_64" "$@"
