#!/bin/bash

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.20.20.100 ansible.homelab.local' >> /etc/hosts
echo '10.20.20.101 rocky.homelab.local' >> /etc/hosts
echo '10.20.20.102 debian.homelab.local'>> /etc/hosts

# Configurando o search
sed -i 's/^#Domains=$/Domains=homelab.local/' /etc/systemd/resolved.conf