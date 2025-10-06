#!/usr/bin/env bash

DIR="$1"

case "$DIR" in
  up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-
    ;;
esac

