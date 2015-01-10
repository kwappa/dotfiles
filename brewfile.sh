#!/bin/sh
brew update
brew install autoconf
brew install automake
brew install bazaar
brew install cmake
brew install emacs --cocoa
brew linkapps
brew install gdbm
brew install gettext
brew install gibo
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
brew install wget
brew install xz
brew install zsh

brew install caskroom/cask/brew-cask
brew cask install xquartz

brew tap sanemat/font
brew install ricty
cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

brew upgrade
brew cleanup
