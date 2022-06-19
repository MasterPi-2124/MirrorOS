#!/bin/bash

on_chroot << EOF
	systemctl set-default graphical.target
	python3 -m pip install --upgrade pip
	python3 -m pip install keras numpy opencv-python regex imutils datetime
	curl -sl https://deb.nodesource.com/setup_16.x | sudo -E bash
	apt install -y nodejs 
	npm install --location=global pm2
	git clone https://github.com/MichMich/MagicMirror 

	cd MagicMirror
	npm install --only=prod --omit=dev
	wget -O config/config.js https://raw.githubusercontent.com/MasterPi-2124/SmartMirror/master/config/config.js
	cd modules
	git clone https://github.com/bugsounet/EXT-Detector
	git clone https://github.com/bugsounet/MMM-GoogleAssistant
	git clone https://github.com/bugsounet/Gateway
	git clone https://github.com/bugsounet/EXT-Alert
	cd EXT-Detector && npm install
	cd ../Gateway && npm install
	cd ../EXT-Alert && npm install
	cd ../MMM-GoogleAssistant && npm install
EOF