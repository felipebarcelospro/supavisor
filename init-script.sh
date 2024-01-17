#!/bin/bash

# Instalação do Node.js e Laravel Mix
curl -sL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs
npm install -g npm@latest
npm install -g laravel-mix@latest

# Navega para a pasta do projeto Elixir
cd /.

# Executa os comandos do Elixir
mix deps.get && mix ecto.migrate --prefix _supavisor --log-migrator-sql

# Outros comandos que você queira executar
