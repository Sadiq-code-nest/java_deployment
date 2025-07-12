#!/bin/bash

# If not installed, install it through : sudo apt update &&
sudo apt install default-jdk -y

# Create a new /opt/tomcat directory for your Tomcat installation:
sudo mkdir -p /opt/tomcat
# To create a new group called tomcat, enter: 
sudo groupadd tomcat

# set /opt/tomcat as the home directory: 
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

 # In the terminal, move to the /tmp directory: 
cd /tmp
curl -O https://dlcdn.apache.org/tomcat/tomcat- 10/v10.1.34/bin/apache- tomcat10.1.34.tar.gz
sudo tar xzvf apache-tomcat-10*tar.gz  –stripcomponents=1 -C /opt/tomcat
sudo chown -RH tomcat: /opt/tomcat
sudo sh -c 'chmod +x /opt/tomcat/bin/*.sh'
sudo update-java-alternatives -l
sudo nano /etc/systemd/system/tomcat.service

# Add the following configuration in the tomcat.service file and replace
the JAVA_HOME path with your Java installation path:
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

# Set environment variables properly
Environment=JAVA_HOME=/usr/lib/jvm/java-1.21.0-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

# Startup and shutdown commands
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target

# Reload the system daemon: 
sudo systemctl daemon-reload
#Start the Tomcat service: 
sudo systemctl start tomcat
#Enable Tomcat to start on boot: 
sudo systemctl enable tomcat
#Verify the Apache Tomcat service is running: 
sudo systemctl status tomcat

  
