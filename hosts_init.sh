#!/bin/bash

#Copiando chave publica SSH
mkdir -p /home/vagrant/.ssh
#cp /vagrant/key/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
#chmod 400 /home/vagrant/.ssh/id_rsa.pub

# Garantindo a chave publica
AUTH_KEY=$(head -n1 /home/vagrant/.ssh/authorized_keys)
echo -e "$AUTH_KEY" > /home/vagrant/.ssh/authorized_keys
cat /vagrant/key/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
