#!/bin/bash
#
#----------------------------------------------------------------------#
#        name:  Dockerfile
# description:  compiles base wallet environment, install wallets on top
#      author:  thebradfish
#     twitter: 	@fleshwounded
#     website: 	bradspodium.xyz
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

FROM ubuntu:16.04

WORKDIR wallet/src/

#Install dependencies
RUN apt-get update
RUN apt-get install -y automake
RUN apt-get install -y libdb++-dev
RUN apt-get install -y build-essential libtool autotools-dev
RUN apt-get install -y autoconf pkg-config libssl-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libminiupnpc-dev
RUN apt-get install -y git
RUN apt-get install -y software-properties-common
RUN apt-get install -y python-software-properties
RUN apt-get install -y g++
RUN apt-get install bsdmainutils

#Download and compile the Berkely DB v4.8 database
RUN add-apt-repository ppa:bitcoin/bitcoin -y
RUN apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev -y

#Download the Wallet sourcecode
