#!/bin/bash
export USER=root
mkdir -p /var/run/sshd
nohup /usr/sbin/sshd -D &
python /code/run.py
