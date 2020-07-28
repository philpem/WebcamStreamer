#!/bin/bash

# requires sudo to load the module

sudo insmod ./v4l2loopback.ko devices=1 card_label="LoopbackCam" exclusive_caps=1

ffmpeg -i udp://@224.0.0.1:9999 -analyzeduration 1 -fflags -nobuffer -probesize 32  -c:v rawvideo -pix_fmt yuyv422 -f v4l2 /dev/video0

