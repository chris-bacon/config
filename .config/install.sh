#!/bin/bash

function configure() {
    configure_vim
    configure_haskell
    configure_zsh
    configure_github
}

function configure_vim(){
    echo -e "\nInstalling Neovim"
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt install neovim

    echo -e "\nInstalling vim Plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function configure_haskell() {
    echo -e "\nInstalling Nix"
    curl https://nixos.org/nix/install | sh && . $HOME/.nix-profile/etc/profile.d/nix.sh

    echo -e "\nInstalling Stack"
    curl -sSL https://get.haskellstack.org/ | sh
}

function configure_zsh() {
    echo -e "\nMaking Zsh default"
    echo "export SHELL=/bin/zsh" >> $HOME/.bashrc
    echo "[ -z \"$ZSH_VERSION\" ] && exec /bin/zsh -l" >> $HOME/.bashrc
    echo -e "\nInstalling Oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function configure_github() {
    echo -e "\nSetting up Git config"
    git config --global user.name "chris-bacon"
    git config --global user.email "chrisbacon2009@hotmail.com"
}

function create_dirs_if_not_exist() {
    echo -e "Making directories...\n"
    if [ ! -d ~/personal ]; then
        sudo mkdir ~/personal/
    fi
    
    if [ ! -d ~/haskell ]; then
        sudo mkdir ~/haskell/
    fi
}

function update() {
    echo -e "Updating...\n"
    sudo apt-get update
    sudo apt-get upgrade
}

function install_programs() {
    unix=(git git-flow zsh python-dev python-pip python3-dev python3-dev python3 software-properties-common tmux mlocate curl i3 rxvt-unicode rxdb)
    for i in ${unix[@]}
        do
            if ! [ -x "$(command -v $i)" ]; then
                echo -e "\n$i not installed. Installing $i now"
                sudo apt install $i
            fi
        done
}

function exit_msg() {
    echo -e """
        .___                    
      __| _/____   ____   ____  
     / __ |/  _ \ /    \_/ __ \ 
    / /_/ (  <_> )   |  \  ___/ 
    \____ |\____/|___|  /\___  >
         \/           \/     \/ 
    """
}


function main() {
  #  update
    install_programs
 #   configure
 #   set_github_config
 #   create_dirs_if_not_exist
    exit_msg
}

main
