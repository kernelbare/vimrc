# Install szh, autosuggestions and syntax highlighting
```Bash
sudo apt-get install zsh zsh-autosuggestions zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

# Install Starship
```Bash
curl -sS https://starship.rs/install.sh | sh
```

# Configure Starship preset
```Bash
starship preset gruvbox-rainbow -o ~/.config/starship.toml
```

# Install FZF
```Bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Configure ~/.zshrc
```Bash
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
