warp-cli connect

sudo ifconfig | grep "eth0"
if [ $? -eq 0 ]
then
    echo " The ip address has been set successfully"
else
   echo " The ip address wasn't  set successfully"
fi


sudo openvpn ~/Downloads/Moataz.Elmorsey.ovpn
sleep 4

ip_vpn=$(curl -s ifconfig.me)
if [ "$ip_vpn" -eq 0]
then
echo "connected to open vpn with IP : $ip_vpn"
warp-cli disconnect
ping 10.10.10.10 -c 3
else
echo "Failed to connect vpn"
fi
