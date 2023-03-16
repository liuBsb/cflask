#!/bin/zsh
cflask() {
  if [ $# -eq 0 ]; then
    echo "Você deve fornecer um nome para o aplicativo.\n Ex: cflask <myapp>"
    exit 1
  fi

# Use o argumento fornecido pelo usuário aqui

  app_name=$1  # nome da aplicação
  srcdir="$ZSH_CUSTOM/plugins/cflask/src"
  if [ -d $srcdir ];then
    cp -r "${srcdir}/"* .
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

def create_mini_app():
    app = Flask(__name__)
    return app


def create_app(objConfig):
    app = create_mini_app()
    app.config.from_object(objConfig)

    return app

EOF

  touch "${app_name}/controllers/main_controller.py"
  cat > "${app_name}/controllers/main_controller.py" << EOF
from flask import Blueprint, render_template

main_blueprint = Blueprint('main_controller', __name__)


@main_blueprint.route('/')
def index():
    return render_template('index.html')


@main_blueprint.route('/about')
def about():
    return render_template('about.html')
EOF
  
  touch "${app_name}/controllers/user_controller.py"

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

touch "config.py"
cat > "config.py" << EOF 
import os
import secrets


class Config:
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True
    SECRET_KEY = secrets.token_hex(16)
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class ProductionConfig(Config):
    DEBUG = False
    SECRET_KEY = secrets.token_hex(16)
    SQLALCHEMY_DATABASE_URI = os.environ.get(
    'DATABASE_URL', 'sqlite:///my_database.db')


class StagingConfig(Config):
    DEVELOPMENT = True
    DEBUG = True


class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = os.environ.get(
    'DATABASE_URL', 'sqlite:///my_development.db')



class TestingConfig(Config):
    TESTING = True
    SECRET_KEY = secrets.token_hex(16)
TESTING = True
    SQLALCHEMY_DATABASE_URI = 'postgresql://usuario:senha@host:porta/${app_name}-test-db'
EOF

touch "run.py"
cat > "run.py" << EOF 
from flask import Flask, render_template
from pdfbooks import create_minimal_app
from pdfbooks.controllers.main_controller import main_blueprint


# Initialize the Flask application
app = create_minimal_app()

# Register the blueprints for the controllers
app.register_blueprint(main_blueprint)


# Start the application
if __name__ == '__main__':
    app.run(debug=True)

EOF
make venv
if [ -d env ]; then

  source env/bin/activate
  make install 
fi
}