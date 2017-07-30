#!/bin/bash
#
#----------------------------------------------------------------------#
#        name:  Dockerfile
# description:  docker build for renos coin wallet daeomon, renosd
#      author:  thebradfish
#     twitter: 	@fleshwounded
#     website: 	bradspodium.xyz
#----------------------------------------------------------------------#

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
RUN export DEBIAN_FRONTEND=noninteractive

ENV HOME /src
WORKDIR /src/wallets

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo

#Install dependencies
RUN sudo apt-get update
RUN sudo apt-get install -y apt-utils
RUN sudo apt-get install -y automake
RUN sudo apt-get install -y libdb++-dev
RUN sudo apt-get install -y build-essential libtool autotools-dev
RUN sudo apt-get install -y autoconf pkg-config libssl-dev
RUN sudo apt-get install -y libboost-all-dev
RUN sudo apt-get install -y libminiupnpc-dev
RUN sudo apt-get install -y git
RUN sudo apt-get install -y software-properties-common
RUN sudo apt-get install -y python-software-properties
RUN sudo apt-get install -y g++
RUN sudo apt-get install -y bsdmainutils
RUN sudo apt-get install -y openjdk-8-jre-headless
RUN sudo apt-get install -y libgmp3-dev libevent-dev

#Download and compile the Berkely DB v4.8 database
RUN sudo add-apt-repository ppa:bitcoin/bitcoin -y
RUN sudo apt-get update
RUN sudo apt-get install -y libdb4.8-dev libdb4.8++-dev -y

#Install nano because you know you like it more then Vim
RUN sudo apt-get install -y nano

#Download the wallet sourcecode
RUN sudo git clone https://github.com/RenosCoin/RenosCoin.git
RUN sudo cd RenosCoin/src && sudo rm -rf secp256k1
RUN sudo cd RenosCoin/src && sudo git clone https://github.com/bitcoin-core/secp256k1.git 
RUN sudo cd RenosCoin/src/secp256k1 && sudo ./autogen.sh && sudo ./configure && sudo make && sudo make install
RUN sudo cp /usr/local/lib/libsecp256k1.* /usr/lib
RUN sudo cp RenosCoin/src/crypto RenosCoin/src/obj/crypto -rR
RUN sudo chmod 755 RenosCoin/src/leveldb/*

RUN cd RenosCoin/src && sudo make -f makefile.unix USE_UPNP=0
RUN cd RenosCoin && sudo mkdir bin && sudo mv src/RenosCoin bin/
RUN cd RenosCoin/src && sudo make -f makefile.unix clean

#Cleanup
RUN sudo apt-get autoremove -y
RUN sudo apt-get purge -y
