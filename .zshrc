# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias vi="nvim"
alias readme="glow README.md -p"

alias tmux="TERM=xterm-256color tmux"

export PATH=/home/payne/.local/bin:$PATH

# Use modern completion system
# autoload -Uz compinit
# compinit

export VISUAL=nvim
export EDITOR="$VISUAL"

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [[ -n "$_TUTR" ]] && source $_TUTR || true  # shell tutorial shim DO NOT MODIFY
