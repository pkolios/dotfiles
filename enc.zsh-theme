if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$(vi_mode_prompt_info) %{$fg[black]%}%{$reset_color%}%{$fg[blue]%}%~$(git_prompt_info) %{$fg[magenta]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='$FG[242]%n@%m%{$reset_color%}%'

# vi-mode
MODE_INDICATOR="%F{red}>>>%f"
INSERT_MODE_INDICATOR=""

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"
