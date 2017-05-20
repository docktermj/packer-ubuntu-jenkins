#!/bin/bash

# References:
# - https://www.howtoforge.com/tutorial/how-to-install-jenkins-with-apache-on-ubuntu-16-04/

# Enable "add-apt-repository" command.
# Reference: http://lifeonubuntu.com/ubuntu-missing-add-apt-repository-command/

apt-get -y install python-software-properties software-properties-common

# Add repository
# Reference: http://manpages.ubuntu.com/manpages/xenial/man1/add-apt-repository.1.html

add-apt-repository -y ppa:openjdk-r/ppa
apt-get update

# Install JAVA

apt-get -y install openjdk-7-jdk

# Add jenkins key and repository to the system

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian-stable binary/' | tee -a /etc/apt/sources.list

# Update the repository and install Jenkins.

apt-get update
apt-get -y install jenkins

# Start Jenkins on port 8080 at reboot.

systemctl start jenkins
systemctl enable jenkins

