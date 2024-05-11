FROM ubuntu:20.04

RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git wget \
    cmake=3.16.3-1ubuntu* \
    build-essential=12.8ubuntu* \
    clang-10 \
    bison \
    flex \
    swig \
    klayout \  
    libeigen3-dev=3.3.7-2 \  
    libboost-all-dev=1.71.0.0ubuntu2 \  
    libffi-dev=3.3-4 \  
    libreadline-dev=8.0-4 \  
    libspdlog-dev \
    tcl-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cp -f /usr/include/tcl8.6/*.h /usr/include/ && \
    ln -s -f /usr/lib/x86_64-linux-gnu/libtcl8.6.so /usr/lib/x86_64-linux-gnu/libtcl8.5.so

RUN wget http://lemon.cs.elte.hu/pub/sources/lemon-1.3.1.tar.gz && \
    tar zxvf lemon-1.3.1.tar.gz && \
    cd lemon-1.3.1 && cmake ./ && make -j$(nproc) && make install && \
    rm -rf lemon-1.3.1*

ENV LD_LIBRARY_PATH=/root/iFLow/tools/iEDA_0.1/lib

WORKDIR /root/iFlow
