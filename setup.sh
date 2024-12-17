#!/bin/bash

# Nome do ambiente virtual
VENV_DIR="venv"

echo "🛠️  Configurando o ambiente virtual Python..."

# Criar o ambiente virtual se não existir
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv $VENV_DIR
    echo "✅ Ambiente virtual criado com sucesso!"
else
    echo "ℹ️  Ambiente virtual já existe. Pulando criação."
fi

# Ativar o ambiente virtual
source $VENV_DIR/bin/activate

echo "📦 Instalando dependências..."
pip install --upgrade pip
pip install flask python-docx google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

echo "✅ Dependências instaladas com sucesso!"

# Executar o aplicativo Flask
echo "🚀 Iniciando o servidor Flask..."
export FLASK_APP=app.py
export FLASK_ENV=development
flask run
