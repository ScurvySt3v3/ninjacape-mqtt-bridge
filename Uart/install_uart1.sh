#!/bin/bash
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
echo "It Works!"
echo
config-pin -q 926 uart
config-pin -q 924 uart
echo
echo
