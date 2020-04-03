# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="enc"

# Path
PATH="/usr/local/opt/terraform@0.11/bin:/Users/enc/Library/Python/3.7/bin:$PATH"

# Aliases
# neovim
alias vim="nvim"
alias vi="nvim"

# ripgrep common args
# -C 2: 2 lines context | -M 160: Print up to 160th line column
alias rg='rg -C 2 -M 160'
alias rgv='/usr/local/bin/rg'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

# Legacy python compiled file clear
alias pycleaner="pyclean .;"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Tool shortcuts
alias tf='terraform'
alias dc='docker-compose'

# Exports
export EDITOR="nvim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=25"

# Every terminal tab has it's own history instead of sharing a common one
unsetopt inc_append_history
unsetopt share_history
setopt APPEND_HISTORY

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(docker docker-compose vi-mode)

source $ZSH/oh-my-zsh.sh
