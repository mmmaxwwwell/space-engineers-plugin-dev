#!/bin/bash
sudo rm -rf ./plugin-builder/DedicatedServerPluginTest/{bin,obj}
sudo chmod 777 ./plugin-builder/DedicatedServerPlugin
cd space-engineers-dedicated-docker-linux
sudo docker-compose down
