#!/bin/bash
rm $PREFIX/bin/ngrok
rm -rf $PREFIX/share/ngrok
mkdir -p $PREFIX/share/ngrok
cp get-ngrok.sh $PREFIX/share/ngrok
chmod +x ngrok
cp ngrok $PREFIX/bin
apt update && apt upgrade -y
apt install -y proot wget resolv-conf
apt clean
apt autoremove
cd $PREFIX/share/ngrok
bash get-ngrok.sh
echo -e "\e[1;32mNgrok installed sucessfull!"
echo ""
echo -e -n "\e[1;32mPegue su authtoken de ngrok >>"
read a
./ngrok authtoken $a
sleep 2
echo -e "\e[1;34m Configurado correctamente"
echo "Run : ngrok http [puerto]"
echo "Run : ngrok tcp [puerto]"
echo " To use ngrok"
