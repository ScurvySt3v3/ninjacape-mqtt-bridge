#!/bin/bash
echo
echo "Install some dependencys"
echo
echo
sudo apt-get update
sudo apt-get install --yes python-pip curl mosquitto mosquitto-clients
echo
echo
echo "Install pyserial and paho-mqtt"
echo
echo
sudo pip install pyserial
sudo pip install paho-mqtt
echo
echo "Activate uart1"
echo
sudo curl -o /usr/local/bin/enable_uart1.sh https://raw.githubusercontent.com/ScurvySt3v3/ninjacape-mqtt-bridge/master/Uart/enable_uart1.sh
sudo chmod +x /usr/local/bin/enable_uart1.sh
sudo curl -o /lib/systemd/enable_uart1.service https://raw.githubusercontent.com/ScurvySt3v3/ninjacape-mqtt-bridge/master/Uart/enable_uart1.service
sudo ln /lib/systemd/enable_uart1.service /etc/systemd/system/enable_uart1.service
sudo systemctl daemon-reload
sudo systemctl enable enable_uart1.service
sudo systemctl start enable_uart1.service
echo
echo
config-pin -q 926 uart
config-pin -q 924 uart
echo
echo
echo
echo
echo "Get ninjaMQTTBridge and make it daemon-ised"
echo
echo
sudo curl --create-dirs -o /opt/ninjaCapeSerialMQTTBridge/ninjaMQTTBridge.py https://raw.githubusercontent.com/ScurvySt3v3/ninjacape-mqtt-bridge/master/ninjaMQTTBridge.py
sudo chmod +x /opt/ninjaCapeSerialMQTTBridge/ninjaMQTTBridge.py
sudo curl -o /etc/init/mqttbridge.conf https://raw.githubusercontent.com/ScurvySt3v3/ninjacape-mqtt-bridge/master/mqttbridge.conf
sudo curl -o /etc/init.d/ninjaMQTTBridge.sh https://raw.githubusercontent.com/ScurvySt3v3/ninjacape-mqtt-bridge/master/ninjaMQTTBridge.sh
sudo chmod +x /etc/init.d/ninjaMQTTBridge.sh
sudo update-rc.d ninjaMQTTBridge.sh defaults
sudo /etc/init.d/ninjaMQTTBridge.sh start
echo
echo
echo "Don't forget to change the MQTT in /opt/ninjaCapeSerialMQTTBridge/ninjaMQTTBridge.py"
echo
echo

