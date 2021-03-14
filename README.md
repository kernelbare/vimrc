# A Good Vim configuration for Linux Servers Admins

## Installation

```bash
git clone https://github.com/kernelbare/basic-vimrc.git ~/.vim
```

## Dependecies
### Install Nodejs

```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install gcc g++ make
sudo apt-get install -y nodejs
node --version
```

### Install Yarn (optional)

```bash
## Install Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn --version
```

### On Ubuntu

```shell
sudo apt install git curl silversearcher-ag exuberant-ctags agrep unzip jq ack-grep 
```
### On CentOS
```bash
sudo yum -y install epel-release ctags the_silver_searcher agrep ack
```
### On Fedora Server
```bash
sudo dnf -y install ctags the_silver_searcher agrep ack
```

## Recommendations and Fancy Settings

If you use Ubuntu 20.04 as your Desktop, for a good experience, I recommend installing Terminator.
```shell
sudo apt install terminator
```

You can download my Terminator settings

```shell
curl https://raw.githubusercontent.com/lazcastro/good-vimrc/master/config/terminator/config -o ~/.config/terminator/config
```

Do you like a fancy shell? Installing [startship](https://starship.rs/) you will have a good one.   
```shell
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```


