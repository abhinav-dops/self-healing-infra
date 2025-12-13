#!/bin/bash

sudo dnf update -y
sudo dnf install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo docker pull naqua/self-healing-app:01

sudo docker rm -f selfhealing || true

sudo docker run -d --name selfhealing -p 80:8080 naqua/self-healing-app:01

