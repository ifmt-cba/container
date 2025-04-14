#!/bin/bash

apt update
apt -y upgrade
apt -y install nano git
git clone https://www.github.com/ifmt-cba/container
cd container
ls


