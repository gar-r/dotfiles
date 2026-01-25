#!/bin/sh

layouts=$(niri msg keyboard-layouts | awk '/^[[:space:]]*[* ]+[0-9]+/ {for (i=1;i<=NF;i++) if ($i ~ /^[0-9]+$/) {print $i; break}}')
current=$(niri msg keyboard-layouts | awk '/\*/ {for (i=1;i<=NF;i++) if ($i ~ /^[0-9]+$/) {print $i; break}}')

if [ -z "$layouts" ] || [ -z "$current" ]; then
  exit 0
fi

set -- $layouts
next=""
found=0

for idx in "$@"; do
  if [ "$found" -eq 1 ]; then
    next="$idx"
    break
  fi

  if [ "$idx" = "$current" ]; then
    found=1
  fi
done

if [ -z "$next" ]; then
  next="$1"
fi

niri msg action switch-layout "$next"
