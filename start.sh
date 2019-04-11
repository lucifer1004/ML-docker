#!/bin/env bash

export UNAME=gabriel
export LOCAL_WORKSPACE="/home/ubuntu/com.github/lucifer1004/ProSAIL"

docker rm jupyter -f && \
docker run --name jupyter -p 11515:8888 --restart always -v ${LOCAL_WORKSPACE}:/home/${UNAME}/workspace lucifer1004/machine-learning
