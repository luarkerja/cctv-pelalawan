#!/bin/bash

# link url RTSP
cctv1="rtsp://user:password@ip-address:port/Streaming/channels/101"
cctv2="rtsp://user:password@ip-address:port/Streaming/channels/101"
cctv3="rtsp://ip-address:port/5e464590848e2cc5ec3e5fef_1"
cctv4="rtsp://ip-address:port/5f97b841848ef75490fd9824_1"

# setting audio dan resolution
AUDIO_OPTS="-c:a aac -b:a 160000 -ac 2"
VIDEO_OPTS="-s 854x480 -c:v libx264 -b:v 2048000"
OUTPUT_HLS="-hls_time 6 -hls_list_size 6 -hls_wrap 6"

# convert RTSP to hls m3u8
ffmpeg -rtsp_transport tcp -v verbose -i "$cctv1" -i "$cctv2" -i "$cctv3" -i "$cctv4" \ 
    -map 0 -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS /var/www/html/live/namacctv1.m3u8 \
    -map 1 -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS /var/www/html/live/namacctv2.m3u8 \
 		-map 2 -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS /var/www/html/live/namacctv3.m3u8 \
		-map 3 -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS /var/www/html/live/namacctv4.m3u8
