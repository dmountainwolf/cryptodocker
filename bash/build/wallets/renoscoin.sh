#!/bin/bash
#
#----------------------------------------------------------------------#
#      author:  thebradfish
#     twitter: 	@fleshwounded
#     website: 	bradspodium.xyz
#        name:  renoscoin.sh
# description:  shell script compiles renos coin wallet daemon source
#               and configures with random name and passwords, then it
#               begins the wallet in daemon mode. if you plan to stake
#               or run a master node you will need to configure it 
#               before it will work the way you intend. otherwise use
#               wallet as usual.
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
						   
git clone https://github.com/RenosCoin/RenosCoin.git  
cd RenosCoin  
cd src  
rm -rf secp256k1  
git clone https://github.com/bitcoin-core/secp256k1.git  
cd secp256k1  
./autogen.sh  
./configure  
make  
make install  
cp /usr/local/lib/libsecp256k1.\* /usr/lib  
cd ..  
cp crypto obj/crypto -rR   
cd leveldb  
chmod 755 \*  
cd ..  
make -f makefile.unix
cd ~
mkdir -p wallets/renoscoin/bin
export PATH=$PATH:/$HOME/wallets/renoscoin/bin
mkdir $HOME/.renoscoin
echo rpcallowip=127.0.0.1 > $HOME/.renoscoin/renos.conf
echo rpcuser=`date +%s | sha256sum | base64 | head -c 16 ; echo` >> $HOME/.renoscoin/renos.conf
echo rpcpassword=`date +%s | sha256sum | base64 | head -c 32 ; echo` >> $HOME/.renoscoin/renos.conf
echo daemon=1 >> $HOME/.renoscoin/renos.conf																   
$HOME/renoscoin/bin/renosd -daemon
