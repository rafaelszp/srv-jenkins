#!/bin/sh

REPO_URL="http://static.sistemafieg.org.br/getin/dev"
JDK_FILE="jdk-7u79-linux-x64.tar.gz"
JDK_URL="$REPO_URL/$JDK_FILE"
JDK_FOLDER="jdk1.7.0_79"


if [ -d "/opt/$JDK_FOLDER" ]; then
  echo "JDK já instalada"
  exit 0 
fi

if [ ! -d "/home/vagrant/downloads" ]; then
  mkdir -p /home/vagrant/downloads
fi

echo "Download da JDK"

if [ ! -f "/home/vagrant/downloads/$JDK_FILE" ]; then
  wget $JDK_URL -O /home/vagrant/downloads/$JDK_FILE
fi

echo "Instalando JDK"

sudo unlink /opt/java 2>/dev/null
sudo tar zxf /home/vagrant/downloads/$JDK_FILE -C /opt
sudo ln -s /opt/$JDK_FOLDER /opt/java
sudo alternatives --install /usr/bin/java java /opt/java/bin/java 1
sudo alternatives --install /usr/bin/jar jar /opt/java/bin/jar 1
sudo alternatives --install /usr/bin/keytool keytool /opt/java/bin/keytool 1
sudo alternatives --install /usr/bin/jstack jstack /opt/java/bin/jstack 1


#Criando o usuário JAVA
sudo userdel java 2>/dev/null
sudo sudo useradd -r -s /bin/false java

#Instalando fontes
sudo rpm -Uvh http://static.sistemafieg.org.br/getin/dev/msttfcorefonts-2.5-1.noarch.rpm 2>/dev/null

#Desabilitando firewall
echo "Desabilitando o Firewall"
sudo systemctl disable firewalld
sudo systemctl stop firewalld

exit 0
