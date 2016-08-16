plugins=(git)

export PATH=$HOME/bin:$HOME/tool:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# enable auto-completion
autoload -U compinit
compinit -u

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# colors
autoload -Uz colors
colors

# prompt
PROMPT='%F{blue}[%*] %F{red}%%%f '

# Aliases
alias ls="ls -G"
alias ll="ls -la"
alias berspec="bundle exec rspec"
alias sprspec="bundle exec spring rspec"
alias bx="bundle exec"
alias bi="bundle install --path=vendor/bundle"
alias g="git"
alias emacs='emacs -nw'
alias e='emacsclient -nw -a ""'
alias ek='emacsclient -e "(kill-emacs)"'

# HISTORY
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

# use 256 colors emacs in terminal
export TERM="xterm-256color"

# disable logout by Ctrl-D
setopt IGNOREEOF

# for rbenv
if [[ -s $HOME/.rbenv ]] ; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - zsh)"
fi

# for Heroku Toolbelt
if [[ -s "/usr/local/heroku/bin" ]] ; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

# for npm
if [[ -s "/usr/local/share/npm/bin" ]] ; then
    export PATH="/usr/local/share/npm/bin:$PATH"
fi

# for local environment
[ -f ~/.zshrc.include ] && source ~/.zshrc.include
[ -f ~/.zshrc.local   ] && source ~/.zshrc.local

# for golang / peco
if [[ -s "/usr/local/opt/go/libexec/bin" ]] ; then
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    export GOPATH=$HOME
fi
p() { peco | while read LINE; do $@ $LINE; done }
alias q='ghq list -p | p cd'

# for gem-open
export GEM_EDITOR="emacs"

# for AWS CLI
[ -f /usr/local/share/zsh/site-functions/_aws ] && source /usr/local/share/zsh/site-functions/_aws

# for Android Studion platform-tools
if [[ -s "$HOME/Library/Android/sdk/platform-tools" ]] ; then
    export PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools"
fi

# for homebrew on El Capitan
alias writable-usr-local='sudo chown -R $(whoami):admin /usr/local'
