#!/bin/bash
#arch=dpkg --print-architecture

# download
rm -rf ~/frp
mkdir -p ~/frp
cd ~/frp 
#wget https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_arm.tar.gz

# for test
cp /home/pi/frp_0.33.0_linux_arm.tar.gz .
sleep 10

sudo mkdir -p /etc/frp
sudo tar -xvf frp_0.33.0_linux_arm.tar.gz -C /etc/frp
cd /etc/frp/frp_0.33.0_linux_arm

## modify
hostname=`hostname`
sed -i '2s/127.0.0.1/117.187.32.193/g' frpc.ini
sed -i '3s/7000/10086/g' frpc.ini
sed -i "5s/ssh/${hostname}/" frpc.ini
sed -i '9s/6000/0/g' frpc.ini

## start frpc
./frpc -c ./frpc.ini
