#!/bin/bash
DIR="/plugin/DedicatedServerPlugin"
if [ -d "$DIR" ]; then
  cd $DIR
  git pull
else
  cd /plugin
  git clone https://github.com/mmmaxwwwell/DedicatedServerPlugin.git
fi

cd $DIR
nuget restore
xbuild DedicatedServerPluginTest.sln