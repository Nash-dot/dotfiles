#!/bin/bash
if pgrep -x wf-recorder > /dev/null; then
    pkill -INT -x wf-recorder
    notify-send "Recording stopped"
else
    notify-send "Recording started"
#Mid quality Recording    
   # wf-recorder -a "alsa_output.pci-0000_00_1f.3.analog-stereo.monitor" -f ~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4 -x yuv420p -c libx264 -p crf=18 -r 30
#Highest quality Recording
    wf-recorder -a "alsa_output.pci-0000_00_1f.3.analog-stereo.monitor" -f ~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4 -x yuv420p -c libx264 -p crf=0 -p preset=veryslow -r 60
fi
