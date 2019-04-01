#!/bin/sh

sudo -y yum update


### locate
yum -y install mlocate

### Docker CE
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo yum install -y docker-ce-18.09.4-3.el7 docker-ce-cli-18.09.4-3.el7 containerd.io
sudo chmod +x /usr/local/bin/docker

### Docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl enable docker


### docker
### Dockerコマンドをsudoなしで実行する方法
### https://daragda.herokuapp.com/archives/1956

# dockerグループがなければ作る
sudo groupadd docker

# 現行ユーザをdockerグループに所属させる
sudo gpasswd -a $USER docker

# dockerデーモンを再起動する (CentOS7の場合)
sudo systemctl restart docker
