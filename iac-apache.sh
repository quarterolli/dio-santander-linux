#!/bin/bash

echo "Atualizando índice de pacotes e instalando servidor Apache..."
apt-get update && apt-get install apache2 -y

echo "Baixando os arquivos da aplicação..."
cd /tmp
wget -O - https://github.com/quarterolli/AppShelf/archive/refs/heads/main.tar.gz | tar -xz
cd AppShelf-main || { echo "Falha no download!"; exit 1; }

echo "Copiando arquivos para o diretório do servidor Apache..."
cp -R * /var/www/html

echo "Aplicação configurada com sucesso!"
