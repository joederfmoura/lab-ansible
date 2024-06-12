#!/bin/bash

# Instala o pip e depois o ansible
# Verifica se o python3-pip está instalado
if ! dpkg -l | grep -q python3-pip; then
    echo "python3-pip não está instalado. Instalando..."
    sudo apt update
    sudo apt install -y python3-pip
else
    echo "python3-pip já está instalado."
fi

# Atualiza pip
echo "Atualizando pip..."
pip3 install pip --upgrade

# Verifica se o ansible está instalado
if ! pip3 show ansible > /dev/null 2>&1; then
    echo "ansible não está instalado. Instalando..."
    pip3 install ansible
else
    echo "ansible já está instalado."
fi

#Criar grupo ansible e add usuário vagrant ao grupo
sudo groupadd ansible
sudo usermod -aG ansible vagrant

#Configuração do ansible
KEY_PATH='/vagrant/files/ansible'
sudo mkdir -p /etc/ansible

#Configurar as permissões para que apenas o usuário root e o grupo Ansible possam acessar e modificar.
sudo chown -R root:vagrant /etc/ansible
sudo chmod -R 750 /etc/ansible

# Copiar os arquivos ansible_cfg e hosts
sudo cp $KEY_PATH/ansible.cfg /etc/ansible/ansible.cfg
sudo cp $KEY_PATH/hosts /etc/ansible/hosts

#Arquivo ansible.cfg e hosts geralmente contém configurações sensíveis, portanto, restrinja as permissões.
sudo chown root:ansible /etc/ansible/ansible.cfg
sudo chown root:ansible /etc/ansible/hosts
sudo chmod 640 /etc/ansible/ansible.cfg
sudo chmod 640 /etc/ansible/hosts


#Criar arquivo de log
sudo touch /var/log/ansible.log
sudo chown -R root:vagrant /var/log/ansible.log
sudo chmod 760 /var/log/ansible.log


# Cria e copia as chaves SSH
mkdir -p /vagrant/key
ssh-keygen -q -t rsa -f /vagrant/key/id_rsa -N ''
mkdir -p /home/vagrant/.ssh
sudo cp /vagrant/key/id_rsa /home/vagrant/.ssh/id_rsa
sudo cp /vagrant/key/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa*
sudo chmod 400 /home/vagrant/.ssh/id_rsa*
