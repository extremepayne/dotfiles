# dotfiles
My . files

## Install

### Clone repo and copy files

```sh
git clone git@github.com:extremepayne/dotfiles.git
cd dotfiles
```

`.p10k.zsh`, `.zpreztorc`, `.zshrc`, and `.ideavimrc` go in `~`.
Files and folders in `bin/` should go in `~/.local/bin`.
Everything else goes in `~/.config`.

### Install zsh

`yay -S zsh` or `sudo apt install zsh`

```sh
chsh -s /bin/zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Install Neovim

`sudo apt install neovim` or `yay -S neovim`

#### Nvim plugins

Enter Neovim

```
:PlugInstall
:CocInstall coc-pyright
:CocInstall coc-json
```

### Font installation

Make sure to install Meslo LGS NF 13.
