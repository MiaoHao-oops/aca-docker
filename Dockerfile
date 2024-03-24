FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y git wget
RUN apt-get install -y build-essential=12.8ubuntu*
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \  
    echo "Asia/Shanghai" > /etc/timezone && \  
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake=3.16.3-1ubuntu*
RUN apt-get install -y clang-10
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y swig
RUN apt-get install -y klayout
RUN apt-get install -y \  
    libeigen3-dev=3.3.7-2 \  
    libboost-all-dev=1.71.0.0ubuntu2 \  
    libffi-dev=3.3-4 \  
    libreadline-dev=8.0-4 \  
    libspdlog-dev
RUN apt install tcl-dev -y
RUN cp -f /usr/include/tcl8.6/*.h /usr/include/
RUN ln -s -f /usr/lib/x86_64-linux-gnu/libtcl8.6.so /usr/lib/x86_64-linux-gnu/libtcl8.5.so
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget http://lemon.cs.elte.hu/pub/sources/lemon-1.3.1.tar.gz
RUN tar zxvf lemon-1.3.1.tar.gz
RUN cd lemon-1.3.1 && cmake ./ && make -j$(nproc) && make install
RUN rm -rf lemon-1.3.1*

WORKDIR /root/iFlow
