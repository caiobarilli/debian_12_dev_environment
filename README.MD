# Debian 12 Dev Enviroment Automation

Script de automação para instalação de ambiente de desenvolvimento no Debian 12.

<br />

## Extrutura do Projeto

```bash
├── logs
│   └── debian_12_dev_enviroment.log
├── src
│   ├── main
│   ├── menus
│   │   ├── main_menu
│   │   └── manual_installation
│   ├── reset
│   │   ├── env
│   │   ├── git
│   │   └── ssh
│   ├── setup
│   │   ├── ends
│   │   ├── git
│   │   ├── init
│   │   ├── ssh
│   │   └── vars
│   └── utils
│       ├── logs
│       └── user
│── .gitignore
│── .editorconfig
├── README.md
├── treeview
│── generate
└── install.sh
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
sudo bash ./install.sh
```

## Logs

Os logs de execução do script são armazenados no arquivo `debian_12_dev_enviroment.log` localizado em `./logs/`
