# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="enc"

# Load the shell dotfiles, and then some:
# * ~/.mix-path can be used to extend `$PATH`.
# * ~/.mix-extra can be used for other settings you don’t want to commit to your repo.
for file in ~/.zsh/{path,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Every terminal tab has it's own history instead of sharing a common one
setopt APPEND_HISTORY

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew pip python docker docker-compose vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
