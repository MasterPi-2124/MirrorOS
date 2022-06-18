#!/bin/bash -e

# go to home folder

on_chroot << EOF
	python3 -m pip install --upgrade pip
	python3 -m pip install keras numpy opencv-python regex imutils datetime
	curl -sl https://deb.nodesource.com/setup_16.x | sudo -E bash
	apt install -y nodejs 
	npm install -g pm2
	echo $(ls -a)
EOF

# Clone and build MagicMirror
cd "${ROOTFS_DIR}/home/${FIRST_USER_NAME}"
git clone https://github.com/MichMich/MagicMirror 
cd MagicMirror

npm install --only=prod --omit=dev

# Add default config file
cp config/config.js.sample  config/config.js

# Install Google Assistant
cd modules
git clone https://github.com/bugsounet/EXT-Detector
git clone https://github.com/bugsounet/MMM-GoogleAssistant
git clone https://github.com/bugsounet/Gateway
git clone https://github.com/bugsounet/EXT-Alert
cd EXT-Detector && npm install
cd ../Gateway && npm install
cd ../EXT-Alert && npm install
cd ../MMM-GoogleAssistant && npm install
