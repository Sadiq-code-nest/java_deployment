# Java Deployment with Apache Tomcat 9
 
This project provides a shell script to automate the installation and configuration of Apache Tomcat 9 on an Ubuntu server, enabling the deployment of Java web applications.
Overview
The script installs Apache Tomcat 9, sets up a dedicated tomcat user and group, configures a systemd service, and prepares the server for deploying Java WAR files. The live deployment can be accessed at http://54.161.71.139:8080/.
Prerequisites

Ubuntu 20.04 or later
sudo privileges
Internet access for downloading dependencies

Installation

Clone the Repository:
git clone https://github.com/Sadiq-code-nest/java_deployment.git
cd java_deployment


Make the Script Executable:
chmod +x deploy_tomcat.sh


Run the Script:
sudo ./deploy_tomcat.sh


Verify Deployment:

Check the Tomcat service status:sudo systemctl status tomcat


Access the default Tomcat page at http://<your-server-ip>:8080.



Deploying Your Application
To deploy a custom Java web application:

Place your myapp.war file in /opt/tomcat/webapps/:sudo cp myapp.war /opt/tomcat/webapps/ROOT.war


Restart Tomcat:sudo systemctl restart tomcat


Access your app at http://<your-server-ip>:8080/.

Troubleshooting

Logs: Check /opt/tomcat/logs/catalina.out for errors.
Port Issues: Ensure port 8080 is open:sudo ufw allow 8080


Java Version: Verify Java 8 or later is installed:java -version



Notes

The script uses Tomcat 9 (not 10.1.34 as in the original script) to match the live server’s configuration.
Secure the server by enabling HTTPS and removing default apps (/opt/tomcat/webapps/examples, etc.).
For production, configure a firewall and restrict access to the Tomcat Manager.

Resources

Live Server
GitHub Repository
Apache Tomcat Documentation

License
MIT License. See LICENSE for details.
