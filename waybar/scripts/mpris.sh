#!/bin/bash
status=$(playerctl status 2>/dev/null)

case "$status" in
  Playing)
    title=$(playerctl metadata --format '{{ title }}' 2>/dev/null)
    echo "󰝚 ${title:0:30}"
    ;;
  Paused)
    title=$(playerctl metadata --format '{{ title }}' 2>/dev/null)
    echo "󰏤 ${title:0:30}"
    ;;
  *)
    echo "󰝚 Not Playing"
    ;;
esac
