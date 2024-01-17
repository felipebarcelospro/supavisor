#!/bin/bash

echo "2024-01-17 12:14:14 - Installing pre-requisites"

# Usar sudo se necessário para garantir a execução como root
sudo apt-get update
sudo apt-get install -y curl

# Instalação do Node.js
curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt-get install -y nodejs

# Instalação do Laravel Mix
sudo npm install -g npm@latest
sudo npm install -g laravel-mix@latest

# Certifique-se de que Elixir está instalado
# sudo apt-get install -y elixir (se necessário)

# Comandos do Elixir
cd /supavisor
sudo mix deps.get
sudo mix ecto.migrate --prefix _supavisor --log-migrator-sql
