#!/bin/sh

rawStatus=$(warp-cli status)
status=$(echo "$rawStatus" | awk '/Status update/ {print $3}')

if [ $status == "Disconnected" ]; then
	warp-cli connect
	notify-send -a "Cloudflare" --expire-time=1000 -i zero-trust-orange "1.1.1.1 started."
else
	warp-cli disconnect
	notify-send -a "Cloudflare" --expire-time=1000 -i zero-trust-orange "1.1.1.1 stopped."
fi
