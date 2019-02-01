#!/bin/bash

function configure() {
    configure_vim
    configure_haskell
    configure_zsh
    configure_github
}

function configure_vim(){
    if ! [ -x "$(command -v nvim)" ]; then
        echo -e "\nNeovim is not installed. Installing Neovim"
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt install neovim
    fi

    if [ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
        echo -e "Vim plug is not installed. \nInstalling vim Plug"
        curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
}

function configure_haskell() {
    if [ ! -d $HOME/.nix-profile ]; then
        echo -e "\nnix-profile does not exist. Installing nix-profile"
        curl https://nixos.org/nix/install | sh && . $HOME/.nix-profile/etc/profile.d/nix.sh
    fi

    if ! [ -x "$(command -v stack)" ]; then
        echo -e "\nStack does not exist. Installing stack"
        curl -sSL https://get.haskellstack.org/ | sh
    fi
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
    if [ ! -d $HOME/personal ]; then
        sudo mkdir $HOME/personal/
    fi
    
    if [ ! -d $HOME/haskell ]; then
        sudo mkdir $HOME/haskell/
    fi
}

function update() {
    echo -e "Updating...\n"
    sudo apt-get update
    sudo apt-get upgrade
}

function install_programs() {
    unix=(git git-flow zsh python-dev python-pip python3-dev python3-dev python3 software-properties-common tmux mlocate curl i3 rxvt-unicode rxdb fonts-powerline)
    for i in ${unix[@]}
        do
            if ! [ -x "$(command -v $i)" ]; then
                echo -e "\n$i not installed. Installing $i now"
                sudo apt install $i
            fi
        done
}

function install_tmux_config() {
    cd ~
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
}

function install_polybar() {
    sudo apt install build-essential git cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y
    cd ~
    git clone --recursive https://github.com/jaagr/polybar
    cd polybar
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    sudo make install
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
    update
    install_programs
    configure
    set_github_config
    create_dirs_if_not_exist
    install_tmux_config
    exit_msg
}

main
