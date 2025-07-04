# colors
autoload -Uz colors && colors

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# prompt
PROMPT='%F{blue}[%*] %F{red}%%%f '

# Aliases
alias ls="ls -G"
alias ll="ls -laG"
alias g="git"

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history

# less with multibite chars
export LESSCHARSET=utf-8

# disable logout by Ctrl-D
setopt IGNOREEOF

# homebrew
if type brew &>/dev/null; then
    export PATH="/opt/homebrew/bin:$PATH"
    # zsh-completions
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit && compinit
    # zsh-autosuggestions
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # diff-highlight
    export PATH=$PATH:/opt/homebrew/share/git-core/contrib/diff-highlight/
fi

# ghq / peco
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
p() { peco | while read LINE; do $@ $LINE; done }
alias q='ghq list -p | p cd'

# rbenv
eval "$(rbenv init - zsh)"

# nodebrew
if [ -d $HOME/.nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
