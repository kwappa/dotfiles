#!/bin/sh
brew update
brew install autoconf
brew install automake
brew install cmake
brew install emacs --with-cocoa --with-gnutls
brew linkapps emacs
brew install gdbm
brew install gettext
brew install git
brew install go
brew install hub
brew install icu4c
brew install imagemagick
brew install jpeg
brew install libevent
brew install libiconv
brew install libpng
brew install libtiff
brew install libtool
brew install libxml2
brew install markdown
brew install openssl
brew install pcre
brew install pkg-config
brew install python
brew install rbenv
brew install readline
brew install ruby-build
brew install the_silver_searcher
brew install tmux
brew install reattach-to-user-namespace
brew install wget
brew install xz
brew install zsh
brew install zsh-completions
brew install pwgen

brew install ghq
brew install peco
brew install heroku
go get -u github.com/nsf/gocode

brew upgrade
brew cleanup
