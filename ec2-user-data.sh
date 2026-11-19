#!/bin/bash
# User data da EC2 (Amazon Linux 2023): instala e inicia o Docker
dnf update -y
dnf install -y docker
systemctl enable --now docker
usermod -aG docker ec2-user
