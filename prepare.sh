#!/bin/bash

sudo apt install \
            git wget flex bison gperf \
            python3 python3-pip python3-setuptools python-is-python3 \
            cmake ninja-build ccache libffi-dev libssl-dev

mkdir ~/esp
cd ~/esp
git clone -b v4.1 --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf
./install.sh
source ~/esp/esp-idf/export.sh