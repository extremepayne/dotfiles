# dotfiles
My . files

## Linux install:
```sh
git clone git@github.com:extremepayne/dotfiles.git
cd dotfiles
cp .p10k.zsh ~
cp .vimrc ~
cp .zpreztorc ~
cp .zshrc ~
```

Arch
```sh
yay -S zsh
```

Debian
```
sudo apt install zsh
```

```
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

That last command will take a while

```sh
chsh -s /bin/zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Enter vim

`:PlugInstall`

For neovim (optinal):

`sudo apt-get install neovim` or `yay -S neovim`

Debian stretch, instead do this:

Append `deb http://ftp.de.debian.org/debian stretch-backports main` to `etc/apt/sources.list`

`sudo apt-get -t stretch-backports install "neovim"`

Do as instructed by `:help nvim-from-vim`
