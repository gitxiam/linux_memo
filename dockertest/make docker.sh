#!/bin/bash

apt-get install docker
apt-get install docker.io

docker run -it ubuntu bash
docker run -it python:3.9
#ssl problems?
docker run -it python:3.9 --force

docker run -it python:3.9
docker run -it --entrypoint=bash python:3.9

#now build docker
docker build -t test:pandas .
docker run -it test:pandas

#now serios start docker with args

docker run -it test:pandas 2023-12-11
#['pipeline.py', '2023-12-11']
#Job success if = 2023-12-11

