#!/bin/bash


cd /root/sysbench
./autogen.sh
./configure
make
make install
