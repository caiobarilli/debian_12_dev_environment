# Debian 12 Dev Enviroment Automation

Script de automação para instalação de ambiente de desenvolvimento no Debian 12.

<br />

## Extrutura do Projeto

```bash
debian_12_dev_enviroment/
├── src/
│   │── scripts/
│   │   ├── menus/
│   │   │   ├── main_menu.sh
│   │   │   └── manual_installation.sh
│   │   ├── prepare/
│   │   │   └── 01_setup_requirements.sh
│   │   ├── reset/
│   │   │   ├── 01_env.sh
│   │   │   ├── 02_ssh.sh
│   │   │   └── 03_git.sh
│   │   └── steps/
│   │       ├── 01_vars.sh
│   │       ├── 02_ssh.sh
│   │       ├── 03_git.sh
│   │       └── 04_ends.sh
│   └── main.sh
├── logs/
│   └── debian_12_dev_enviroment.log
├── storage/
│   ├── vars/
│   │   └── user_vars
│   └── keys/
│       └── my_keys
│           ├── my_private_key
│           └── my_public_key.pub
│── .gitignore
│── .editorconfig
├── README.md
│── generate.sh
└── run.sh
```

## Download

Faça o download do projeto com o comando:

```sh
git clone git@github.com:caiobarilli/debian_12_dev_enviroment.git
```

## Como usar

Você pode criar uma pasta em `./storage/keys/` com a chave publica e privada para acesso ao git.
Executar o script de instalação como root/sudo e seguir as instruções:

```sh
sudo sh ./run.sh
```

## Logs

Os logs de execução do script são armazenados no arquivo `debian_12_dev_enviroment.log` localizado em `./logs/`
