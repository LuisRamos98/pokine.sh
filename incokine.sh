#!/bin/bash

#==================================================#
#           Instalacion de Herramientas
#==================================================#


if ! ls ./resources &> /dev/null ; then
	mkdir resources
fi

# Instalamos unzip
if ! which unzip > /dev/null ; then
	sudo apt -y install unzip
fi

# Instalamos lsd
if ! which lsd > /dev/null ; then
	sudo apt -y install lsd 
fi

# Instalamos batcat
if ! which batcat > /dev/null ; then
	sudo apt -y install bat 
fi

# Instalamos gcc | C compiler
if ! which gcc > /dev/null ; then
	sudo apt -y install gcc
fi

# Instalamos kitty
if ! which kitty > /dev/null ; then
	sudo apt -y install kitty
fi

# Instalamos zsh
if ! which zsh > /dev/null ; then
        sudo apt -y install zsh
fi

# Instalamos neovim
if ! which nvim > /dev/null ; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
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

  cp -R "$dirKitty" ~/.config/kitty/
fi

#==================================================#

#================ PowerLevel10k ===================#

## Instalamos zsh

SHELL=/bin/bash sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

## Instalamos Fonts Requerida

if ls ./resources/Meslo.zip > /dev/null ; then
	dirFont=./resources/Meslo 
	mkdir "$dirFont" 2>/dev/null
	unzip ./resources/Meslo.zip -d "$dirFont"
	sudo cp -R "$dirFont" /usr/share/fonts/
	sudo fc-cache -f -v
fi

## Instalamos PowerLevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## Modifcamos Archivo .zshrc

sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc # Añadimos path para el nvim al nuevo .zshrc

## Colocamos nuestro archivo de configuración de PowerLevel10k

rm ~/.p10k.zsh  ~/.zshrc

cp -R ./powerlevel10k/ ~/
cp ./.p10k.zsh ~/ 
cp ./.zshrc ~/

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


#============= Limpieza ===========================#
rm -rf ./resources ./nvim-linux64.tar.gz 



