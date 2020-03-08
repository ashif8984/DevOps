
# Jenkins INstallation in Ubuntu
# Run using root


wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

#vi /etc/default/jenkins

sudo service jenkins start
sudo service jenkins status
