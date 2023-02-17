#!/bin/sh

brew update
brew install zsh
brew install zsh-completions
brew install tmux
brew install git
brew install rbenv
brew install go
brew install the_silver_searcher
brew install wget
brew install ghq
brew install peco
go get -u github.com/nsf/gocode

brew tap homebrew/cask-fonts
brew install --cask font-ricty-diminished
brew install --cask visual-studio-code

brew upgrade
brew cleanup
