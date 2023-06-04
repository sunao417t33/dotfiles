#!/usr/bin/zsh

export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=/usr/local/bin:$PATH

#--Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -U compinit && compinit -u
autoload -Uz colors
colors

setopt print_eight_bit
setopt auto_cd
setopt no_beep
setopt auto_pushd
setopt pushd_ignore_dups
setopt no_auto_remove_slash
setopt glob_dots
setopt hist_no_store
setopt extended_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
unsetopt correct
unsetopt correct_all

#--zstyle
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
DIRSTACKSIZE=20

#--umask
umask 022

#-bindkey
#function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print $1"/"$2}'| rev)\007" }

#--neovim
if type nvim >/dev/null 2>&1; then
    export EDITOR='nvim'
    export VISUAL='nvim'
    alias v='nvim'
    alias vi='nvim'
    alias vim='nvim'
    alias view='nvim -R'
else
    export EDITOR='vim'
    export VISUAL='vim'
    alias v='vim'
    alias vi='vim'
fi

#--Per Enviroments
if [[ "$(uname)" == 'Linux' ]]; then
    alias ls='ls -a --color=auto'
    
    if [[ "$(uname -r)" == *microsoft* ]]; then
        export PATH=$(echo $PATH | tr ':' '\n' \
                                 | grep -v "/mnt/c/" \
                                 | tr '\n' ':');
    fi

elif [[ "$(uname)" == 'Darwin' ]]; then
    alias ls='ls -AFG'
    alias history='history -Di 1'
    
    #--lima and docker
    if type lima >/dev/null 2>&1 || type docker >/dev/null 2>&1; then
        export DOCKER_HOST=unix://$HOME/docker.sock
    fi
    
    #--openssl v3
    if [[ -d /usr/local/opt/openssl@3 ]]; then
        export PATH="/usr/local/opt/openssl@3/bin:$PATH"
        export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
        export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
        #export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"
    fi

    #--Apple Slicon
    if [[ -d /opt/homebrew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

#--alias
alias ll='ls -ltr'
alias dirs='dirs -v'
alias grep='grep --color=auto'
alias history='history 1'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

if type git >/dev/null 2>&1; then 
    alias gadd='git add'
    alias gcom='git commit'
    alias glog='git log'
    alias gpush='git push'
    alias gpull='git pull'
    alias gmain='git push origin main'
fi

#--Path
#--fzf
if type fzf >/dev/null 2>&1; then
  if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
  else
    source ~/.fzf.zsh
  fi
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
  export FZF_DEFAULT_OPT='--height 40% --reverse --border'
fi


for dir in $(find ~ -maxdepth 1 -type d | sed 's!^.*/\.!!' | grep -v /)
do
    case "$dir" in
        "nvm")
            export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
            ;;
        "pyenv")
            export PYENV_ROOT=~/.pyenv/shims
            export PATH="$PYENV_ROOT/bin:$PATH"
            eval "$(pyenv init --path)"
            ;;
        "goenv")
            export GOENV_ROOT=~/.goenv
            export PATH="$GOENV_ROOT/bin:$PATH"
            eval "$(goenv init -)"
            ;;
        "cargo")
            source ~/.cargo/env
            ;;
        *)
            ;;
    esac
done
