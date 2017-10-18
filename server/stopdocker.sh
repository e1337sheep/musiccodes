#!/bin/bash
# Stop and remove musicode container
echo Stopping Muzicode server...
sudo docker stop muzicodes && \
echo Muzicode server stopped && \
echo Removing container... && \ 
sudo docker rm muzicodes && \
echo Muzicode container removed
