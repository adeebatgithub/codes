
echo "[*] upgrading...."
apt upgrade -y
echo "[*] updating...."
apt update -y

echo "---------------------------------"
echo "[+] installing python"
apt install python
echo "[+] installing required libraries..."
echo "[*] for bot"
cd /sdcard/python/bot
pip install -r requirements.txt
echo "[*] for tool"
cd /sdcard/python/tool
pip install -r requirements.txt
pip install pytube

echo "----------------------------------"
echo "[*] changing motd"
cp /sdcard/python/motd $PREFIX/etc/motd

echo "---------------------------------"
echo "[+] setting commands Bot,Tool"
echo "python /sdcard/python/bot/bot.py" > $PREFIX/bin/Bot
chmod +x $PREFIX/bin/Bot
echo "python /sdcard/python/tool/tool.py" > $PREFIX/bin/Tool
chmod +x $PREFIX/bin/Tool
echo "[*] command created"

sleep 1
exit
