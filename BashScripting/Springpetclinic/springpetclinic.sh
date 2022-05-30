#!/bin/bash
# bash script for springpetclinic installation 
# updating the system 
sudo yum update all -y
wait
echo "system successfully updated"
# Installation of httpd
echo "installing httpd" 
sudo yum install httpd -y
# Starting, enabling and checking httpd status 
sudo systemctl start httpd && sudo systemctl enable httpd && sudo sytemctl status httpd
wait
echo "httpd successfully installed"
# Installation of Java openjdk
echo "Installing openjdk"
sudo yum install java-1.8.0-openjdk -y
wait
echo "Checking java version"
java -version
echo "openjdk successfully installed"
# Installation of git and maven
echo "Installing git and maven"
sudo yum install -y git maven
echo " Checking git and maven versions"
git --version
mvn --version
echo "git and maven successfulling installed"
# Installation of wget
echo "Installing wget"
sudo yum install wget -y
wait
echo "wget successfully installed"
# Changing to home directory 
cd ~
# Downloading apache maven binaries
sudo wget https://downloads.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
wait
echo "Apache maven binaries successfully downloaded"
# Extracting apache maven 
sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt
# Creating symbolic link between apache and maven 
sudo ln -s /opt/apache-maven-3.8.4 /opt/maven
echo "Apache maven successfully extracted"
# Installation of java and maven home environment variables
sudo vim /etc/profile.d/maven.sh
sed -i export JAVA_HOME=/usr/lib/jvm/jre-11-openjdk
sed -i export M2_HOME=/opt/maven
sed -i export MAVEN_HOME=/opt/maven
sed -i export PATH=${M2_HOME}/bin:${PATH}
wait
echo "Java and maven home varibles successfully installed"
# Setting executable permisions on maven.sh file 
sudo chmod +x /etc/profile.d/maven.sh
# Reading and executing maven.sh file 
source /etc/profile.d/maven.sh
wait
echo "Maven.sh file successfully read and executed"
# Checkiing maven version 
# mvn -version
# cloning the springpetclinic repository from github 
sudo git clone https://github.com/spring-projects/spring-petclinic.git
wait
echo "springpetclinic successfully cloned"
# Setting permisions on cloned springpetclinic 
sudo chown ec2-user:ec2-user /home/ec2-user/
sudo chown ec2-user:ec2-user /home/ec2-user/spring-petclinic
sudo chown ec2-user:ec2-user /home/ec2-user/spring-petclinic/.mvn/*
sudo chown ec2-user:ec2-user /home/ec2-user/spring-petclinic/.mvn
sudo chown ec2-user:ec2-user /home/ec2-user/spring-petclinic/.editorconfig
echo "Permissions successfully changed"
# Removing springpetclinic from the home ec2-user directory
sudo rm -rf  /home/ec2-user/spring-petclinic/.g*
echo "Springpetclinic successfully removed from home ec2 user directory"
# Changing directory to springpetclinic directory 
cd spring-petclinic
echo "Directory successfully changed"
# Springpetclinic build stage 
mvn clean package
wait
echo "Springpetclinic application successfully built"
# Running springpetclinic application 
java -jar target/*.jar
wait
echo "Welcome to springpetclinic and feel free to bring your pet for consultation"


