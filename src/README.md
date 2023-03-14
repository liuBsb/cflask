# Script de Criação de Aplicação Flask MVC

Este é um script em Shell que automatiza a criação de uma aplicação Flask básica. O script cria diretórios e arquivos base para a aplicação, bem como a estrutura básica do aplicativo Flask.

```
my_projeto/<br>
├── myapp/<br>
│   ├── controllers/<br>
│   │   ├── __init__.py<br>
│   │   ├── main_controller.py<br>
│   │   └── user_controller.py<br>
│   ├── models/<br>
│   │   ├── __init__.py<br>
│   │   ├── main_model.py<br>
│   │   └── user_model.py<br>
│   ├── templates/<br>
│   │   ├── base.html<br>
│   │   ├── index.html<br>
│   │   ├── user_list.html<br>
│   │   └── user_detail.html<br>
│   └── __init__.py<br>
├── config.py<br>
├── run.py<br>
└── requirements.txt<br>
└── requirements-dev.txt<br>
└── README.md<br>
└── .gitignore<br>
└── Makefile<br>
```




O script é chamado `cflask` e requer o nome da aplicação como argumento.


## Uso

Para criar uma aplicação Flask básica, execute o comando abaixo, substituindo `myapp` pelo nome da sua aplicação:

```sh
$ cflask myapp
```



