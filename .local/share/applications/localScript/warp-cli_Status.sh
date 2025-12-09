#!/bin/sh

rawStatus=$(warp-cli status)
status=$(echo "$rawStatus" | awk '/Status update/ {print $3}')

notify-send -a "Cloudflare" --expire-time=2600 -i zero-trust-orange "$rawStatus"
