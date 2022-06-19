#!/bin/bash -e

on_chroot << EOF
    systemctl set-default graphical.target
EOF