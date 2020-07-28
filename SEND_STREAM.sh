#!/bin/bash

ffmpeg -i /dev/video0 -codec libx264 -f mpegts -tune zerolatency udp://224.0.0.1:9999
