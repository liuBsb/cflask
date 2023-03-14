#!/bin/zsh
cflask() {
  app_name=$1  # nome da aplicação
  srcdir="$ZSH_SCRIPTS/${0%/*}/src/"
  if [ -d $srcdir ];then
    echo "Copiando Arquivos de $srcdir"
    cp -r "${srcdir}/"* .
    if      cp -r "${srcdir}/"* .; then
      echo "copiados com sucesso..."
    else echo "Erro ao copiar"
       
    fi

  fi 

  # diretórios raiz da aplicação
  mkdir -p "${app_name}"
  mkdir -p "${app_name}/controllers"
  mkdir -p "${app_name}/models"
  mkdir -p "${app_name}/views"
  mkdir -p "${app_name}/static"
  mkdir -p "${app_name}/templates"

  # arquivos base
  touch "${app_name}/__init__.py"
  cat > "${app_name}/__init__.py" << EOF
from flask import Flask

app = Flask("${app_name}")

from ${app_name}.controllers.main_controller import main_controller
${app_name}.app.register_blueprint(main_controller)
EOF

  touch "${app_name}/controllers/main_controller.py"
  cat > "${app_name}/controllers/main_controller.py" << EOF
from flask import Blueprint, render_template

main_controller = Blueprint('main_controller', __name__)

@main_controller.route('/')
def index():
    return render_template('index.html')

@main_controller.route('/about')
def about():
    return render_template('about.html')
EOF

  touch "${app_name}/templates/index.html"
  cat > "${app_name}/templates/index.html" << EOF
<html>
<head>
<title>Home</title>
</head>
<body>
<h1>Welcome to ${app_name}!</h1>
</body>
</html>
EOF

  touch "${app_name}/templates/about.html"
  cat > "${app_name}/templates/about.html" << EOF
<html>
<head>
<title>About</title>
</head>
<body>
<h1>About ${app_name}</h1>
<p>This is a simple Flask application.</p>
</body>
</html>
EOF
}