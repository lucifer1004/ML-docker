#!/usr/bin/env bash

docker run --name jupyter -p 11515:8888 --restart always -v /home/ubuntu/workspace:/home/workspace lucifer1004/machine-learning