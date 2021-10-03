#!/bin/bash
#clean and build plugin with docker container

sudo rm -rf ./plugin-builder/DedicatedServerPluginTest/{bin,obj}
cd plugin-builder
sudo docker-compose build
sudo docker-compose up

if [[ $? -ne 0 ]]; then
    echo "aborting due to build failure"
    exit 1
fi

cd ../space-engineers-dedicated-docker-linux

#start ds docker container with plugin included
sudo docker-compose down 
rm -rf ./appdata/space-engineers/config/Plugins/* 
cp ../plugin-builder/DedicatedServerPlugin/DedicatedServerPluginTest/bin/x64/Release/DedicatedServerPluginTest.dll ./appdata/space-engineers/config/Plugins/ 


./start 
sudo docker-compose down
sudo rm -rf ./plugin-builder/DedicatedServerPluginTest/{bin,obj}