# Good Vim configuration for Linux Servers Admins

## Installation
    git clone https://github.com/lazincastro/basic-vimrc.git ~/.vim

## Dependecies
### On Ubuntu
    sudo apt install git curl silversearcher-ag exuberant-ctags agrep unzip jq ack-grep 
### On CentOS
    sudo yum -y install epel-release ctags the_silver_searcher agrep ack
### On Fedora Server
    sudo dnf -y install ctags the_silver_searcher agrep ack
    
## Recomendations and Fancy Settings

If you use Ubuntu 20.04 as your Desktop, for a good experience I recomend to install Terminator
    
    sudo apt install terminator

You can download my Terminator settings

    curl https://raw.githubusercontent.com/lazincastro/good-vimrc/master/config/terminator/config -o ~/.config/terminator/config

Will work propety with [IBM Plex Font](https://github.com/IBM/plex). I Like it the [IBM Plex Mono](https://github.com/IBM/plex/tree/master/IBM-Plex-Mono/fonts/complete/ttf).

Do you like a fancy shell? Install [startship](https://starship.rs/):
    
    curl -fsSL https://starship.rs/install.sh | bash
    echo 'eval "$(starship init bash)"' >> ~/.bashrc


