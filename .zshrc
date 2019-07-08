
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion


autoload -Uz promptinit
promptinit
prompt powerlevel10k

POWERLEVEL9K_MODE='nerdfont-complete'

DEFAULT_USER="harrison"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true


POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0C6'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0C7'

POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\UE0BD'


POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "

zsh_weather(){
  local weather=$(curl -s "wttr.in/$LOC_FOR_ZWEATHER?format='%c+%t+%w'")
  local weather_wo_quotes="${weather//\'/}"
  echo -n "${weather_wo_quotes}"
}

POWERLEVEL9K_CUSTOM_WEATHER="zsh_weather"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator rvm node_version battery custom_weather time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator node_version battery custom_weather time)

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1


POWERLEVEL9K_TIME_FORMAT="%D{%h %d %H:%M}"
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_VCS_GIT_ICON=" "
POWERLEVEL9K_COMMAND_EXECUTION_TIME_ICON=""

POWERLEVEL9K_STATUS_OK_BACKGROUND='004'
POWERLEVEL9K_STATUS_OK_FOREGROUND='040'
POWERLEVEL9K_RVM_BACKGROUND='005'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='000'
POWERLEVEL9K_TIME_BACKGROUND='004'
POWERLEVEL9K_CUSTOM_WEATHER_BACKGROUND='004'
# POWERLEVEL9K_CUSTOM_WEATHER_FOREGROUND='006'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='003'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='000'


POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=(
   $'▏    ▏' $'▎    ▏' $'▍    ▏' $'▌    ▏' $'▋    ▏' $'▊    ▏' $'▉    ▏' $'█    ▏'
   $'█▏   ▏' $'█▎   ▏' $'█▍   ▏' $'█▌   ▏' $'█▋   ▏' $'█▊   ▏' $'█▉   ▏' $'██   ▏'
   $'██   ▏' $'██▎  ▏' $'██▍  ▏' $'██▌  ▏' $'██▋  ▏' $'██▊  ▏' $'██▉  ▏' $'███  ▏'
   $'███  ▏' $'███▎ ▏' $'███▍ ▏' $'███▌ ▏' $'███▋ ▏' $'███▊ ▏' $'███▉ ▏' $'████ ▏'
   $'████ ▏' $'████▎▏' $'████▍▏' $'████▌▏' $'████▋▏' $'████▊▏' $'████▉▏' $'█████▏' )
