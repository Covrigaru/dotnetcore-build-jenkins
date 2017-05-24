sudo apt install docker.io -y
sudo groupadd docker
sudo usermod -a -G docker jenkins
sudo service docker restart