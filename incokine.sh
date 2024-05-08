#!/bin/bash

#==================================================#
#           Instalacion de Herramientas
#==================================================#


if ! ls ./resources &> /dev/null ; then
	mkdir resources
fi

# Instalamos unzip
if ! which unzip > /dev/null ; then
	sudo apt install unzip
fi

# Instalamos gcc | C compiler
if ! which gcc > /dev/null ; then
	sudo apt install unzip
fi

# Instalamos kitty
if ! which kitty > /dev/null ; then
	sudo apt install kitty
fi

# Instalamos neovim
if ! which nvim > /dev/null ; then
	sudo apt install neovim
fi

#==================================================#
#              Configuraciones
#==================================================#


#============ Descargamos Fonts ===================#

cd ./resources

# FiraCode

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip

# Meslo

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip

# JetBrainsMono

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

cd ..

#============ Config. Kitty =======================#

# Copiamos las configuraciones de la kitty
if ls ./kitty/  > /dev/null ; then
  dirKitty=./kitty/

  rm -rf ~/.config/kitty/*

  cp -R "$dirKitty" ~/.config/kitty/
fi

#==================================================#


#============ Config. NvChad =======================#

# Instalamos Requisitos para NvChad

## Seteamos como fuente de Terminal a JetbrainsMono Nerd Font
if ls ./resources/JetBrainsMono.zip > /dev/null ; then
	dirFont=./resources/JetBrainsMono
	mkdir "$dirFont" 2>/dev/null
	unzip ./resources/JetBrainsMono.zip -d "$dirFont"
	sudo cp -R "$dirFont" /usr/share/fonts/
	sudo fc-cache -f -v
fi

if ls ./resources/FiraCode.zip > /dev/null ; then
	dirFont=./resources/FiraCode
	mkdir "$dirFont" 2>/dev/null
	unzip ./resources/FiraCode.zip -d "$dirFont"
	sudo cp -R "$dirFont" /usr/share/fonts/
	sudo fc-cache -f -v
fi


## Borramos Archivos de configuración predeterminado
rm -rf ~/.config/nvim 2>/dev/null
rm -rf ~/.local/share/nvim 2>/dev/null

## Clonamos repositorio de NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim 

rm -rf ~/.config/nvim/.git > /dev/null
 
#nvim

#==================================================#

#================ PowerLevel10k ===================#

if ls ./resources/Meslo.zip > /dev/null ; then
	dirFont=./resources/Meslo 
	mkdir "$dirFont" 2>/dev/null
	unzip ./resources/Meslo.zip -d "$dirFont"
	sudo cp -R "$dirFont" /usr/share/fonts/
	sudo fc-cache -f -v
fi

#==================================================#
