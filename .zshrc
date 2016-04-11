ZSH=$HOME/.oh-my-zsh
ZSH_THEME="imajes"
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=$HOME/bin:$HOME/tool:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# Aliases
alias ll="ls -la"
alias berspec="bundle exec rspec"
alias sprspec="bundle exec spring rspec"
alias bx="bundle exec"
alias bi="bundle install --path=vendor/bundle"
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

# for Android Studion platform-tools
if [[ -s "$HOME/Library/Android/sdk/platform-tools" ]] ; then
    export PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools"
fi

# for homebrew on El Capitan
alias writable-usr-local='sudo chown -R $(whoami):admin /usr/local'
