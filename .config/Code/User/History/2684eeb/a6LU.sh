#!/bin/sh

PASSWORD=TxBdG4NDdAi98a
BASE32_TOKEN=<BASE32 SECRET>
HOST=vpn-ac.urz.uni-heidelberg.de
 
# topt token generation
# tools can be get here https://www.nongnu.org/oath-toolkit/
# also don't forget to set current time
# this method is using is in case if "token" and "password" swapped
# with default topt config use this http://www.infradead.org/openconnect/token.html (no oathtool required)
TOKEN=`oathtool --base32 --totp $BASE32_TOKEN`
 
#user input sequence
sequence="${TOKEN}\n${PASSWORD}"

# CONFIG example
<< ////
user=<username>
authgroup=<group name>
passtos
os=win
////

printf $sequence | openconnect --script /etc/vpnc/vpnc-script --config=CONFIG $HOST