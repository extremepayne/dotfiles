# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias vi="nvim"
alias readme="glow README.md -p"

alias tmux="TERM=xterm-256color tmux"

alias bctl="bluetoothctl"
alias lctl="brightnessctl"

alias restart-spotifyd="systemctl restart --user spotifyd.service"

export PATH=/home/payne/.local/bin:$PATH

export VISUAL=nvim
export EDITOR="$VISUAL"

# Solarized for ls colors
source ~/.zsh/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

# NVM
source /usr/share/nvm/init-nvm.sh

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -n "$_TUTR" ]] && source $_TUTR || true  # shell tutorial shim DO NOT MODIFY
