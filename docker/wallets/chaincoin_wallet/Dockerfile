#!/bin/bash
#
#----------------------------------------------------------------------#
#      author:  thebradfish
#     twitter: 	@fleshwounded
#     website: 	bradspodium.xyz
#        name:  Dockerfile
# description:  compiles chaincoin wallet source, but does not start you
#               will need to configure and execute manually then save
#               your containers state with the supplied shipyard script.
#     funding:  if you find any of this useful, please consider tipping,
#               and or donating, all funds are used to pay for virtual
#				machines hosting various projects like this, thank you!
#----------------------------------------------------------------------#
#        excl:  EKQvE27DbGkTfEuvZ4wFpufdfp4M6gVMUZ
#         rns:  RXtifjA6gnKanV4MLFsz7FBPWGEEFhab3s
#		  chc:  Ca5yFQzYu3vEP9PCRBv6deqqqZFiqbEGXX
#         ent:  EUd7C7uc8JUf3ibVrLRknusapsQpVBdMeB
#         arc:  AXM3CwihR4Xoa63YiGBuuMiX8hkE43G7CT
#         btc:  183mfMcQirWUQXD3wddzuYZPdd8ztKKjVZ
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
