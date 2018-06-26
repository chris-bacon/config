#!/bin/bash
 
unix=(git git-flow zsh python-dev python-pip python3-dev python3-dev python3 software-properties-common tmux mlocate curl i3)
 
echo -e "\n######"
echo -e "Updating...\n"
sudo apt-get update
sudo apt-get upgrade
 
for i in ${unix[@]}
    do
        echo -e "\nInstalling $i"
        sudo apt install $i
    done
 
echo -e "\nInstalling Nix"
curl https://nixos.org/nix/install | sh && . $HOME/.nix-profile/etc/profile.d/nix.sh

echo -e "\nInstalling Stack"
curl -sSL https://get.haskellstack.org/ | sh

echo -e "\nInstalling Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "\nInstalling Neovim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt install neovim

echo -e "\nInstalling vim Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\nSetting up Git config"
git config --global user.name "chris-bacon"
git config --global user.email "chrisbacon2009@hotmail.com"

echo -e "\nMaking Zsh default"
echo "export SHELL=/bin/zsh" >> $HOME/.bashrc
echo "[ -z \"$ZSH_VERSION\" ] && exec /bin/zsh -l" >> $HOME/.bashrc
 
echo -e "\n######"
echo -e "Making directories...\n"
# I use this to demarcate my personal scripts
if [ ! -d /usr/local/bin/custom ]; then
    sudo mkdir /usr/local/bin/custom
fi
if [ ! -d ~/personal ]; then
    sudo mkdir ~/personal/
fi

echo -e """
    .___                    
  __| _/____   ____   ____  
 / __ |/  _ \ /    \_/ __ \ 
/ /_/ (  <_> )   |  \  ___/ 
\____ |\____/|___|  /\___  >
     \/           \/     \/ 
"""
