#!/bin/bash
# User data da EC2 (Amazon Linux 2023): instala Docker, sobe a one-page
# e o Watchtower, que faz o deploy automático a cada nova imagem do pipeline.
dnf install -y docker
systemctl enable --now docker
usermod -aG docker ec2-user
until docker pull ghcr.io/eliasalmeidaa/tramasul-onepage:latest; do sleep 20; done
docker run -d --name tramasul --restart always -p 80:80 \
  ghcr.io/eliasalmeidaa/tramasul-onepage:latest
docker run -d --name watchtower --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower --interval 30 --cleanup tramasul
