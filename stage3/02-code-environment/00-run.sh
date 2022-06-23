#!/bin/bash

on_chroot << EOF
	systemctl set-default graphical.target
	python3 -m pip install --upgrade pip
	python3 -m pip install keras numpy opencv-python regex imutils datetime
	curl -sl https://deb.nodesource.com/setup_16.x | sudo -E bash
	apt install -y nodejs libhdf5-dev libc-ares-dev libeigen3-dev libopenblas-dev libblas-dev openmpi-bin libopenmpi-dev gfortran liblapack-dev 
	npm install --location=global pm2
	npm install -g uuid@latest
	pip3 install gdown
	pip3 install keras_applications==1.0.8 --no-deps
	pip3 install keras_preprocessing==1.1.1 --no-deps
	pip3 install -U --user six wheel mock
	pip3 install pybind11
	pip3 install --upgrade setuptools protobuf==3.20.*
	gdown https://drive.google.com/uc?id=1YpxNubmEL_4EgTrVMu-kYyzAbtyLis29
	pip3 install tensorflow-2.8.0-cp39-cp39-linux_aarch64.whl
	cd /home/"${FIRST_USER_NAME}"
	git clone https://github.com/MichMich/MagicMirror 
	cd MagicMirror && pwd && ls -lah	
	usermod -aG sudo ${FIRST_USER_NAME}
	chmod a+rwx /home/${FIRST_USER_NAME}
	runuser -l ${FIRST_USER_NAME} -c "cd /home/"${FIRST_USER_NAME}"/MagicMirror && npm install --only=prod --omit=dev"
	wget -O config/config.js https://raw.githubusercontent.com/MasterPi-2124/SmartMirror/master/config/config.js
	cd modules
	git clone https://github.com/bugsounet/EXT-Detector
	git clone https://github.com/bugsounet/MMM-GoogleAssistant
	git clone https://github.com/bugsounet/Gateway
	git clone https://github.com/bugsounet/EXT-Alert
	runuser -l ${FIRST_USER_NAME} -c "cd /home/"${FIRST_USER_NAME}"/MagicMirror && npm install"
	runuser -l ${FIRST_USER_NAME} -c "cd /home/"${FIRST_USER_NAME}"/MagicMirror && npm install"
	runuser -l ${FIRST_USER_NAME} -c "cd /home/"${FIRST_USER_NAME}"/MagicMirror && npm install"
	runuser -l ${FIRST_USER_NAME} -c "cd /home/"${FIRST_USER_NAME}"/MagicMirror && npm install"
	cd /home/"${FIRST_USER_NAME}"
	mkdir getFrames && cd getFrames
	wget https://raw.githubusercontent.com/MasterPi-2124/SmartMirror/master/getFrames/rpi/capturev4l2.c
	wget https://raw.githubusercontent.com/MasterPi-2124/SmartMirror/master/getFrames/rpi/Makefile
EOF
