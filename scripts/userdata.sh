#!/bin/bash
echo "Deployed by terraform" >> /home/ec2-user/ready.txt
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd