#! /bin/bash

echo "Atualizando sistema e instalando servidor Apache..."

apt-get update && apt-get upgrade -y
apt-get install apache2 -y

echo "Baixando os arquivos da aplicação..."

cd /tmp
wget -O - https://github.com/quarterolli/AppShelf/archive/refs/heads/main.tar.gz | tar -xz

echo "Copiando arquivos para o diretório do servidor Apache..."

cd AppShelf-main || exit 1
cp -R * /var/www/html

echo "Aplicação configurada com sucesso!"
