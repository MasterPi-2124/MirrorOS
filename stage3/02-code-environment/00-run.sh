#!/bin/bash

on_chroot << EOF
	systemctl set-default graphical.target
	raspi-config nonint do_camera 0
	python3 -m pip install --upgrade pip
	python3 -m pip install keras numpy opencv-python regex imutils datetime
	curl -sl https://deb.nodesource.com/setup_16.x | sudo -E bash
	apt install -y nodejs libhdf5-dev libc-ares-dev libeigen3-dev libopenblas-dev libblas-dev openmpi-bin libopenmpi-dev gfortran liblapack-dev sox libsox-fmt-all libmagic-dev
	npm install --location=global pm2 uuid@latest
	git config --global user.name "${GIT_USERNAME}"
	git config --global user.email "${GIT_EMAIL}"
	pip3 install gdown pybind11 seaborn
	pip3 install keras_applications==1.0.8 --no-deps
	pip3 install keras_preprocessing==1.1.1 --no-deps
	pip3 install -U --user six wheel mock
	pip3 install --upgrade setuptools protobuf==3.20.*
	gdown https://drive.google.com/uc?id=1YpxNubmEL_4EgTrVMu-kYyzAbtyLis29
	pip3 install tensorflow-2.8.0-cp39-cp39-linux_aarch64.whl
EOF
