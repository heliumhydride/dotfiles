#!/bin/bash

mpv av://v4l2:"$1" --profile=low-latency --untimed --video-aspect-override=-1
