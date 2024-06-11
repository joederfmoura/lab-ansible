# lab-ansible
Laboratório para uso no curso [Ansible para SysAdmin](https://www.udemy.com/course/ansible-para-sysadmin)

## Host Ansible
Host para gerenciador os outros hosts
- Terá a chave privada configurada
-Será capaz de conectar via SSH com os outros hosts
- Será instalado o PIP3 e o Ansible

## Host Debian e Rocky
Hosts a serem gerenciados pelo host Ansible
- Terá a chave pública do host Ansible


# Instruções de Configuração do Ambiente

## Requisitos

Para configurar o ambiente de desenvolvimento, você precisará dos seguintes softwares instalados em sua máquina:

1. **Vagrant**
   - Vagrant é uma ferramenta para construir e gerenciar ambientes de desenvolvimento virtualizados. Você pode encontrar a documentação oficial e as instruções de instalação no [site do Vagrant](https://www.vagrantup.com/docs/installation).

2. **VirtualBox**
   - VirtualBox é um software de virtualização de código aberto para uso em computadores x86. Você pode encontrar a documentação oficial e as instruções de instalação no [site do VirtualBox](https://www.virtualbox.org/manual/UserManual.html).

## Passos para Configuração

1. **Clone o repositório**
   - Primeiro, você precisa clonar o repositório do GitHub. Abra o terminal e execute o seguinte comando:
     ```sh
     git clone https://github.com/joederfmoura/lab-ansible
     ```

2. **Acesse a pasta do projeto**
   - Depois de clonar o repositório, navegue até a pasta do projeto com o seguinte comando:
     ```sh
     cd lab-ansible
     ```

3. **Inicie o Vagrant**
   - Com Vagrant e VirtualBox instalados e estando na pasta do projeto, você pode iniciar o ambiente virtual executando:
     ```sh
     vagrant up
     ```

   - Este comando fará o download e a configuração da máquina virtual conforme definido no arquivo `Vagrantfile` do projeto.

4. **Conectando-se às VMs**

    - Depois de iniciar o Vagrant, você pode se conectar às máquinas virtuais usando SSH. Execute os seguintes comandos conforme necessário:

- Para se conectar à VM `ansible` a partir do host hospedeiro:
  ```sh
  vagrant ssh ansible
   ```

- Para se conectar à VM `rocky` a partir do host hospedeiro:
  ```sh
  vagrant ssh rocky
   ```
- Para se conectar à VM `debian` a partir do host hospedeiro:
  ```sh
  vagrant ssh debian
   ```

## Como conectar via ssh a partir da VM ansible

Uma vez que esteja conectado via SSH à VM Ansible teste a conexão ssh com os hosts rocky e debian

  ```sh
  ssh vagrant@10.20.20.101 hostname
   ```

   e 

```sh
  ssh vagrant@10.20.20.102 hostname
   ```



## Observações
- Certifique-se de que você tenha uma conexão estável à internet para o Vagrant baixar as imagens necessárias.
- Caso você encontre algum problema, consulte a documentação oficial do [Vagrant](https://www.vagrantup.com/docs) e do [VirtualBox](https://www.virtualbox.org/manual/UserManual.html) para solução de problemas.
