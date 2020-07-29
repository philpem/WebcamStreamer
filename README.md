# WebcamStreamer

Takes a webcam on one machine (e.g. a desktop PC) and streams it to another (e.g. a laptop). Uses Multicast so will only work over a LAN, but this also means you don't have to mess with IP address configuration. If you don't want multicast, change the IP addresses in the shell scripts.

The receiver needs a kernel driver -- clone this repo recursively, then 'cd v4l2loopback ; make'.

Great for when you're using another machine for conference calls, but that machine is in another room.

Do whatever you like with this. I wrote it because Nomachine NX can't (at the time of writing) stream webcams.

These scripts are also good for throwing other video capture device streams around a network in a low-latency fashion.
