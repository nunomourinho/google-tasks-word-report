@echo off
setlocal

REM Nome do ambiente virtual
set VENV_DIR=venv

echo 🛠️  Configurando o ambiente virtual Python...

REM Verificar se o ambiente virtual já existe
if not exist %VENV_DIR% (
    echo Criando ambiente virtual...
    python -m venv %VENV_DIR%
    echo ✅ Ambiente virtual criado com sucesso!
) else (
    echo ℹ️  Ambiente virtual já existe. Pulando criação.
)

REM Ativar o ambiente virtual
echo 🔄 Ativando ambiente virtual...
call %VENV_DIR%\Scripts\activate

REM Instalar dependências
echo 📦 Instalando dependências...
pip install --upgrade pip
pip install flask python-docx google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

REM Iniciar o servidor Flask
echo 🚀 Iniciando o servidor Flask...
set FLASK_APP=app.py
set FLASK_ENV=development
flask run

endlocal
pause
