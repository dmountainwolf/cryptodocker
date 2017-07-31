#!/bin/bash
#
#----------------------------------------------------------------------#
#        name:  Dockerfile
# description:  compiles chaincoin wallet source, but does not start you
#               will need to configure and execute manually then save
#               your containers state with the supplied shipyard script.
#      author:  thebradfish
#     twitter: 	@fleshwounded
#     website: 	bradspodium.xyz
#----------------------------------------------------------------------#

FROM ubuntu:14.04

WORKDIR ~/wallet/

#Install dependencies
RUN sudo apt-get update
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
RUN sudo apt-get install bsdmainutils

#Download and compile the Berkely DB v4.8 database
RUN sudo add-apt-repository ppa:bitcoin/bitcoin -y
RUN sudo apt-get update
RUN sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

#Download the Chaincoin sourcecode
RUN git clone https://github.com/chaincoin/chaincoin.git
RUN cd chaincoin && ./autogen.sh && ./configure && make && make install
