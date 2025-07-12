# Java Deployment with Apache Tomcat 9

The script installs Apache Tomcat 9, sets up a dedicated tomcat user and group, configures a systemd service, and prepares the server for deploying Java WAR files. The live deployment can be accessed at http://54.161.71.139:8080/.

# Prerequisites
- Ubuntu 20.04 or later
- sudo privileges
- Internet access for downloading dependencies
  
# Installation

- Clone the Repository:
 git clone https://github.com/Sadiq-code-nest/java_deployment.git
 cd java_deployment

- Make the Script Executable:
chmod +x deploy_tomcat.sh

- Run the Script:
sudo ./deploy_tomcat.sh
