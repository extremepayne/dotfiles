# How to set up:


## Homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`


## Git
Install xcode, I think.


## [iTerm2](https://www.iterm2.com/downloads.html)
`brew cask install iterm2`
#### Solarized dark for iterm2
<kbd>⌘,</kbd> Prefs > Profiles > Colors > select solarized dark


## zsh
`brew install zsh zsh-completions`

`zsh`
#### [Prezto](https://github.com/sorin-ionescu/prezto)
`git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"` 
#### Patched font
Download and install a font from https://www.nerdfonts.com, Profiles > Text > select your patched font
#### Powerlevel10k
`prompt help`
Follow instructions to install and make default powerlevel10k.
#### Make zsh the default shell
Prefs > Profiles > General

Command heading, select command, enter `/bin/zsh --login`

## Finish
Put the dotfiles in the `~` directory
