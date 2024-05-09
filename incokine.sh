#!/bin/bash

#==================================================#
#           Instalacion de Herramientas
#==================================================#


if ! ls ./resources &> /dev/null ; then
	mkdir resources
fi

sudo apt -y update


# Instalamos which
if ! command -v which > /dev/null ; then
  sudo apt -y install which
fi

# Instalamos git 
if ! which git > /dev/null ; then
  sudo apt -y install git 
fi

# Instalamos curl 
if ! which curl > /dev/null ; then
  sudo apt -y install curl
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

# Instalamos kitty

if ! which kitty > /dev/null ; then
	sudo apt -y install kitty
fi


#==================================================#
#              Configuraciones
#==================================================#


#============ Descargamos Fonts ===================#

cd ./resources

# FiraCode

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip

# Meslo

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip

# JetBrainsMono

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

# Hack

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip

cd ..

#============ Config. Kitty =======================#

# Copiamos las configuraciones de la kitty
if  ! ls $HOME/.config/kitty &> /dev/null ; then
  mkdir $HOME/.config/kitty 
fi

kiDir=./kitty/ 
cp -R "$kiDir/." $HOME/.config/kitty/


#==================================================#

#================ PowerLevel10k ===================#


## Instalamos oh-my-zsh

SHELL=/bin/bash sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

## Instalamos Fonts Requerida

if ls ./resources/Meslo.zip > /dev/null ; then
	dirFont=./resources/Meslo 
	mkdir "$dirFont" 2>/dev/null
	unzip ./resources/Meslo.zip -d "$dirFont"
	sudo cp -R "$dirFont" /usr/share/fonts/
	sudo fc-cache -f -v
fi

if ls ./resources/Hack.zip > /dev/null ; then
	dirFont=./resources/Hack 
	mkdir "$dirFont" 2>/dev/null
	unzip ./resources/Hack.zip -d "$dirFont"
	sudo cp -R "$dirFont" /usr/share/fonts/
	sudo fc-cache -f -v
fi

## Instalamos PowerLevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## Modifcamos Archivo .zshrc

sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc # Añadimos path para el nvim al nuevo .zshrc

## Colocamos nuestro archivo de configuración de PowerLevel10k

## Eliminamos cualquier instalación previa existente
rm ~/.p10k.zsh  ~/.zshrc 

mv ./powerlevel10k_ahora_si/ ./powerlevel10k/
cp -R ./powerlevel10k/ ~/
cp ./.p10k.zsh ~/ 
cp ./.zshrc ~/

## Instalamos plugins para la zsh 

sudo apt install -y zsh-syntax-highlighting

sudo apt install -y zsh-autosuggestions

sudo apt install -y fzf 
sudo git clone https://github.com/joshskidmore/zsh-fzf-history-search /usr/share/zsh-fzf-history-search

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


#======== Copiamos Configuraciones a root =========#

if ! sudo ls /root/.config > /dev/null ; then
  sudo mkdir /root/.config 
fi 

# PowerLevel10k
sudo cp -R $HOME/powerlevel10k/ /root/
sudo cp $HOME/.p10k.zsh /root/
sudo mv /root/.zshrc /root/.zshrc.bak 
sudo ln -s $HOME/.zshrc /root/.zshrc

# Kitty 
sudo cp -R $HOME/.config/kitty/ /root/.config/.

# NvChad
sudo cp -R $HOME/.config/nvim/ /root/.config/.

#==================================================#


#============= Limpieza ===========================#
rm -rf ./resources ./nvim-linux64.tar.gz 
