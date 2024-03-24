#!/bin/bash

# check if iFlow is cloned
if [ ! -d "iFlow" ]; then
    git clone https://gitee.com/oscc-project/iFlow.git
fi

# change the build script, because we have already install pre-builds in Dockerfile
cp ./build_iflow.sh ./iFlow/build_iflow.sh
docker build -t lab .
docker run -it -v ./iFlow:/root/workspace lab /bin/bash
