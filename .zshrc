# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gentoo"
ZSH_THEME="imajes"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=$HOME/bin:$HOME/tool:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# Customize to your needs...
alias ll="ls -la"
alias berspec="bundle exec rspec"
alias sprspec="bundle exec spring rspec"
alias bx="bundle exec"
alias bi="bundle install"
alias g="git"

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
