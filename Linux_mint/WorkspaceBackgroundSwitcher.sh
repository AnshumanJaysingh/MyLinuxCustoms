#!/bin/bash

# Script to change the desktop image when switching workspaces.
# Add script to startup apps for autorun

desktop_dir="/home/anshu/Pictures/dtbg/" # full path to images directory; 
desktop_img[0]="nord1.jpg"
desktop_img[1]="nord_mount.jpg"
desktop_img[2]="10.png"
desktop_img[3]="tealforest.jpg"
#desktop_img[4]="bts.jpg"
desktop_img[4]="2.png"
# add more images if using more workspaces

setdesktop() {
	gsettings set org.gnome.desktop.background picture-uri "file://$desktop_dir$1"
	}
xprop -root -spy _NET_CURRENT_DESKTOP | (
	while read -r; do
		desk=${REPLY:${#REPLY}-1:1}
		setdesktop ${desktop_img[$desk]}
	done
	)
