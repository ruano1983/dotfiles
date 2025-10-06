#!/usr/bin/env bash
set -eu

# Emite JSON compacto cada segundo con jq -c (una línea por iteración)
while true; do
  status=$(playerctl status 2>/dev/null || echo "Stopped")

  if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
    artist=$(playerctl metadata artist 2>/dev/null || echo "")
    title=$(playerctl metadata title 2>/dev/null || echo "")
    album=$(playerctl metadata album 2>/dev/null || echo "")
    app=$(playerctl -l 2>/dev/null | head -n1 || echo "")

    jq -c -n \
      --arg status "$status" \
      --arg artist "$artist" \
      --arg title "$title" \
      --arg album "$album" \
      --arg app "$app" \
      '{status:$status, artist:$artist, title:$title, album:$album, app:$app}'
  else
    jq -c -n '{status:"Stopped", artist:"", title:"", album:"", app:""}'
  fi

  sleep 2
done

