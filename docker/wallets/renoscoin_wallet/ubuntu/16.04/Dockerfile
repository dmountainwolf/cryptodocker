#!/bin/bash
#
#----------------------------------------------------------------------#
#      author:  thebradfish
#     twitter:  @fleshwounded
#     website:  bradspodium.xyz
#        name:  Dockerfile
# description:  docker build for renos coin wallet daeomon, renosd
#     funding:  if you find any of this useful, please consider tipping,
#               and or donating, all funds are used to pay for virtual
#               machines hosting various projects like this, thank you!
#----------------------------------------------------------------------#
#        excl:  EKQvE27DbGkTfEuvZ4wFpufdfp4M6gVMUZ
#         rns:  RXtifjA6gnKanV4MLFsz7FBPWGEEFhab3s
#                 chc:  Ca5yFQzYu3vEP9PCRBv6deqqqZFiqbEGXX
#         ent:  EUd7C7uc8JUf3ibVrLRknusapsQpVBdMeB
#         arc:  AXM3CwihR4Xoa63YiGBuuMiX8hkE43G7CT
#         btc:  183mfMcQirWUQXD3wddzuYZPdd8ztKKjVZ
#----------------------------------------------------------------------#

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
RUN export DEBIAN_FRONTEND=noninteractive

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

#Install nano because you know you like it more then Vim & we need wget
RUN sudo apt-get install -y nano wget

#Download the wallet sourcecode
RUN sudo git clone https://github.com/RenosCoin/RenosCoin.git
RUN cd RenosCoin/src && sudo rm -rf secp256k1
RUN cd RenosCoin/src && sudo git clone https://github.com/bitcoin-core/secp256k1.git secp256k1
RUN cd RenosCoin/src/secp256k1 && sudo ./autogen.sh && sudo ./configure && sudo make && sudo make install
RUN cp /usr/local/lib/libsecp256k1.* /usr/lib
RUN cp RenosCoin/src/crypto RenosCoin/src/obj/crypto -rR
RUN sudo chmod 755 RenosCoin/src/leveldb/*

RUN cd RenosCoin/src && sudo make -f makefile.unix USE_UPNP=0
RUN sudo mkdir bin && sudo mv RenosCoin/src/renosd bin/
RUN cd RenosCoin/src && sudo make -f makefile.unix clean
RUN sudo mkdir ~/.renoscoin
RUN sudo echo -e "rpcuser=RenosRPC.`openssl rand -base64 8` \nrpcpassword=`openssl rand -base64 32` \nrpcallowip=127.0.0.1 \nstaking=1 \nport=57155 \nserver=1 \nlisten=1 \ndaemon=1 " > ~/.renoscoin/renos.conf
RUN sudo wget https://raw.githubusercontent.com/thebradfish/cryptodocker/master/bash/build/wallets/renoscoin_addnodes.txt && cat renoscoin_addnodes.txt >> ~/.renoscoin/renos.conf

#Cleanup
RUN sudo apt-get autoremove -y
RUN sudo apt-get purge -y

#RUN

CMD /src/wallets/RenosCoin/bin/renosd -daemon
