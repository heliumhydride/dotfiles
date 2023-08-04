#!/bin/bash
vlc v4l2:///dev/video0 :input-slave=alsa://hw:1,0 :v4l2-width=720 :v4l2-height=576 :live-caching=10
