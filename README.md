# dotfiles
My . files

## Install

### Clone repo and copy files

```sh
git clone git@github.com:extremepayne/dotfiles.git
cd dotfiles
```

`.p10k.zsh`, `.zpreztorc`, `.zshrc`, `.ideavimrc`, and `.vimrc` go in `~`.
Files and folders in `bin/` should go in `~/.local/bin`.
Everything else goes in `~/.config`.

### Install zsh

`yay -S zsh` or `sudo apt install zsh`

```sh
chsh -s /bin/zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Install zprezto

```
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
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

#### Set Nvim config to copy `.vimrc`

Do as instructed by `:help nvim-from-vim`

### Solarized dircolors

Run `setupsolarized`

### Font installation

Make sure to install Meslo LGS NF 13.
