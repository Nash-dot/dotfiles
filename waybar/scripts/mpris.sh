#!/bin/bash
status=$(playerctl --player=spotify,brave,%any status 2>/dev/null)

case "$status" in
  Playing)
    title=$(playerctl --player=spotify,brave,%any metadata --format '{{title}}' 2>/dev/null)
    echo "󰓇 ${title:0:30}"
    ;;
  Paused)
    title=$(playerctl --player=spotify,brave,%any metadata --format '{{title}}' 2>/dev/null)
    echo "󰓇 ${title:0:30}"
    ;;
  *)
    echo "󰝚 Not Playing"
    ;;
esac
