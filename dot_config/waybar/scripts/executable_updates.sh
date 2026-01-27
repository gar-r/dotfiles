#!/usr/bin/env bash

count=$(checkupdates --nocolor 2>/dev/null | wc -l)

class=""
if [ "$count" -ge 250 ]; then
  class="critical"
elif [ "$count" -ge 100 ]; then
  class="warning"
fi

if [ "$count" -eq 0 ]; then
  echo '{"text": ""}'
else
  echo "{\"text\": \"\", \"tooltip\": \"$count updates\", \"class\": \"$class\"}"
fi
