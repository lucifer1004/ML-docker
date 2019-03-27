#!/bin/env bash

export UNAME=gabriel

docker rm jupyter -f && \
docker run --name jupyter -p 11515:8888 --restart always -v /home/ubuntu/workspace:/home/${UNAME}/workspace lucifer1004/machine-learning