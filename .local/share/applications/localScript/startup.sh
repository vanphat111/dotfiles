#!/bin/sh

TERMINAL="kitty"

sleep 5
if [ $(kdotool get_desktop) != 1 ]; then
  notify-send -a "System" --expire-time=2600 -i nvidia "Current desktop: $(kdotool get_desktop).
Moving all apps to desktop 1."
  for id in $(kdotool search --name ''); do
    classname=$(kdotool getwindowclassname "$id")

    if [[ "$classname" == "plasmashell" || "$classname" == "lattedock" ]]; then
      continue
    fi

    kdotool set_desktop_for_window "$id" 1
  done
fi

kdotool set_desktop 2

$TERMINAL &
