# How to install


## [Scoop](http://scoop.sh)
`iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`


## Concfg
(to get solarized working)

`scoop install concfg`

`concfg export config-backup.json`

`concfg import solarized-dark basic`

## Some basic dev tools with scoop
`scoop install sudo`

`sudo scoop install 7zip git openssh --global`

`scoop install curl vim grep less touch`

Also install whatever language you're working in.
#### Java
`scoop bucket add java` `scoop install openjdk`
#### Python
`scoop install python`

## Get a patched font
https://www.nerdfonts.com/

## Use the patched font for powershell
This involves editing registries and stuff. Look it up.

## Install vim-plug
https://github.com/junegunn/vim-plug/blob/master/plug.vim
Copy and paste into `plug.vim` in `autoload` directory

## Add the vimrc
Copy/paste the .vimrc file from this repo into wherever your vimrc is coming from
`:source %`
`:PlugInstall`

## Install solarized
Go to your vim directory.
`cd plugged/vim-colors-solarized/colors`
`mv solarized.vim ../../../colors`

## Add custom colors for statusline to solarized.vim

