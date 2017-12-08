#!/bin/bash
# Start the Muzicodes server in the background with default port 3000

echo Starting Muzicodes server on port ${1:-3000}...
#sudo docker run -d --restart=always -p 3000:3000 -p 3030:3030 --name=muzicodes muzicodes:1.1
sudo docker run -it --rm -p 3000:3000 -p 3030:3030 --name=muziccodes muzicodes:1.1
#sudo docker run -d --restart=always -p ${1:-3000}:${1:-3000} --name=muzicodes musiccodes && \

#echo Muzicode sever running on port ${1:-3000}
