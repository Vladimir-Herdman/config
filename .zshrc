# Other than the zsh comments from installation, here are my basics and settings

export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH" # Include if using homebrew
ZSH_THEME=""

# PERSONAL MADE - Change the command line prompt (vcs stuff for git branch)
# Comment for default  
autoload -Uz vcs_info

precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST

update_prompt(){
    vcs_info
    local vir_venv=""
    if [[ -n "$VIRTUAL_ENV" ]]; then
        vir_venv="%{%F{magenta}%}($(basename "$VIRTUAL_ENV"))%{$reset_color%}"
    fi
    if [[ -n "$vcs_info_msg_0_" ]]; then
        local STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
        if [[ -n $STATUS ]]; then
            local status_symbol="%{$fg[red]%}x%{$reset_color%}"
        else
            local status_symbol="%{$fg[green]%}o%{$reset_color%}"
        fi
        PROMPT="${vir_venv}[%n] in %{%F{red}%}%1~%{%f%} on %{%F{blue}%}git:[${vcs_info_msg_0_}] ${status_symbol} %# "
    else
        PROMPT="${vir_venv}[%n] [%D{%L:%M:%S}] in %{%F{red}%}%2~%{%f%} %# "
    fi
}
precmd_functions+=(update_prompt)
chpwd_functions+=(update_prompt)

DISABLE_AUTO_TITLE="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export PAGER="nvim +Man!"

# fzf command macos specific exclusions
export FZF_CTRL_T_COMMAND="fd -H . './' -E Library -E Applications -E Pictures"
export FZF_DEFAULT_COMMAND="fd -H . '/' -E Library -E Applications -E Pictures"
