#!/bin/bash

# requires sudo to load the module

CARDLABEL="LoopbackCam"

sudo insmod ./v4l2loopback/v4l2loopback.ko devices=1 card_label="$CARDLABEL" exclusive_caps=1

for i in /sys/class/video4linux/video*; do
	if [ "$(cat $i/name)" == "$CARDLABEL" ]; then
		VIDEODEV=$(basename "$i")
		break
	fi
done

echo "Video device is /dev/$VIDEODEV"

ffmpeg -i udp://@224.0.0.1:9999 -loglevel fatal -analyzeduration 1 -fflags -nobuffer -probesize 32  -c:v rawvideo -pix_fmt yuyv422 -f v4l2 /dev/$VIDEODEV

