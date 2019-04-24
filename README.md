# ninjacape-mqtt-bridge
<html>
<h2>Python script for grabbing JSON data over serial from the NinjaCape and publishing it as MQTT messages</h2>

I have write a Script for Perrin7´s ninja-mqtt-bridge and addet a activate startup Script for Uart1 on BBW and BBB



To install, Copy and Paste:

wget https://raw.githubusercontent.com/ScurvySt3v3/ninjacape-mqtt-bridge/master/install_ninjaMQTT.sh
chmod +x install_ninjaMQTT.sh
sudo ./install_ninjaMQTT.sh





You can also use the startup Script for Uart1 on BBW and BBB as standalone for your own Projects

<br><b><a href="https://github.com/perrin7/ninjacape-mqtt-bridge/wiki">See perrin7´s  wiki for more information</a></b>

<h3>MQTT messages are structured as follows:</h3>
<ul>
<li>Messages received on 433Mhz as published to:
<br>/ninjaCape/input/<i>DeviceID</i>
<br>payload: <i>DeviceData</i>
</li>
<li>
Messages to be sent out on 433Mhz should be pushlished to:
<br>/ninjaCape/output/<i>DeviceID</i>
<br>payload: <i>DeviceData</i>
</li>
<li>The script subscribes to all updates on /ninjaCape/output/#</li>
</ul>
