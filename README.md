# A Good Vim configuration for Vim/NeoVim

![](https://github.com/kernelbare/vimrc/blob/master/img/2021-03-14_01-20.png)

## Installation

For Vim

```bash
git clone https://github.com/kernelbare/vimrc.git ~/.vim
```

For NeoVim

```bash
git clone https://github.com/kernelbare/vimrc.git ~/.config/nvim
```

## Dependecies

### Ubuntu Packages

```shell
sudo apt install git curl python3-pip python3-venv silversearcher-ag exuberant-ctags jq ack-grep 
```

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

### Python Packages

```shell
sudo pip3 install pynvim flake8 pylint isort jedi jedi-language-server
```

### Install Terraform Language Server

```
# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
# Add the official HashiCorp Linux repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform-ls
```

### Install coc.nvim extensions

```
:CocInstall coc-json coc-yaml coc-jedi  
```
---

## TODO

- Create Windows Terminal settings
- Create WLS2 settings


# ScreenShots

![](https://github.com/kernelbare/vimrc/blob/master/img/2021-03-14_01-24.png)

![](https://github.com/kernelbare/vimrc/blob/master/img/2021-03-14_01-23.png)
