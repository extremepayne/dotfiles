# dotfiles
My . files

Linux install:
```sh
git clone https://github.com/extrempayne/dotfiles
cd dotfiles
cp .p10k.zsh ~
cp .vimrc ~
cp .zpreztorc ~
cp .zshrc ~
sudo apt-get install zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```
This will take a while
```sh
chsh -s /bin/zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Enter vim

`:PlugInstall`
