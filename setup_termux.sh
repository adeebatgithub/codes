#!/bin/bash

red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
noc="\033[0m"

banner () {
    clear
    printf "${yellow}--------------------------------------------------------${noc}\n"
    printf "${red}                   SETTING TERMUX ${noc}\n"
    printf "${yellow}--------------------------------------------------------${noc}\n"
    sleep 2
}

banner
echo ""
echo ""
printf "${yellow}---------------------------------${noc}\n"
printf "${green}[*] upgrading....${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 2
apt update -y
printf "${yellow}---------------------------------${noc}\n"
printf "${green}[*] updating....${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 2
apt upgrade -y

printf "${yellow}---------------------------------${noc}\n"
printf "${green}[+] installing python${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 2
apt install python -y
printf "${yellow}---------------------------------${noc}\n"
printf "${green}[+] installing required libraries...${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 1
echo ""
printf "${green}--> [*] for >> bot${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 1
cd /sdcard/python/bot
pip install -r requirements.txt
pip install setuptools
printf "${green} [*] Done ${noc}\n"
echo ""
printf "${green}--> [*] for >> tool${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 1
cd /sdcard/python/tool
pip install -r requirements.txt
pip install pytube
printf "${green} [*] Done ${noc}\n"
echo ""
printf "${yellow}----------------------------------${noc}\n"
printf "${red}[*] changing motd${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 1
cp /sdcard/python/codes/motd $PREFIX/etc/motd
printf "${green} [*] Done ${noc}"
echo ""
printf "${yellow}---------------------------------${noc}\n"
printf "${green}[+] setting commands${noc}\n"
printf "${yellow}---------------------------------${noc}\n"
sleep 1
echo ""
printf "${green}--> for >> Bot${noc}\n"
sleep 1
echo "python /sdcard/python/bot/bot.py" > $PREFIX/bin/Bot
chmod +x $PREFIX/bin/Bot
printf "${green} [*] command creat : Bot ${noc}"
echo ""
printf "${green}--> for >> Tool${noc}\n"
sleep 1
echo "python /sdcard/python/tool/tool.py" > $PREFIX/bin/Tool
chmod +x $PREFIX/bin/Tool
printf "${green} [*] command created : Tool ${noc}"
echo ""
sleep 1
echo "sh /sdcard/python/codes/cls.sh" > $PREFIX/bin/cls
chmod +x $PREFIX/bin/cls
printf "${green} [*] command created : cls ${noc}"
echo ""
printf "${yellow}---------------------------------${noc}\n"
sleep 2
echo ""
exit 0
