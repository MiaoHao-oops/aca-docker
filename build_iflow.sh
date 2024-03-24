#!/bin/bash

# env
IFLOW_BUILD_THREAD_NUM=$(cat /proc/cpuinfo | grep "processor" | wc -l)
IFLOW_ROOT_DIR=/root/workspace
IFLOW_SHELL_DIR=/root/workspace/scripts/shell
IFLOW_TOOLS_DIR=/root/workspace/tools

if [ $# == "0" ];then
    IFLOW_MIRROR_URL="github.com"
elif [ $# == "2" ] && [ $1 == "-mirror" ];then
    IFLOW_MIRROR_URL=$2
else
    echo "please use './build_flow.sh -mirror <mirror url>' !"
    exit
fi

git config --global --add safe.directory /root/workspace

# update iFlow
cd $IFLOW_ROOT_DIR
git pull origin master

# install tools
$IFLOW_SHELL_DIR/install_tools.sh

# link iEDA lib
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'$IFLOW_TOOLS_DIR'/iEDA_0.1/lib' >> ~/.bashrc
