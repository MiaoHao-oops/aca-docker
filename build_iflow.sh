#!/bin/bash

git config --global --add safe.directory /root/workspace

# update iFlow
cd $IFLOW_ROOT_DIR
git pull origin master

# install tools
$IFLOW_SHELL_DIR/install_tools.sh

# link iEDA lib
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:'$IFLOW_TOOLS_DIR'/iEDA_0.1/lib' >> ~/.bashrc
