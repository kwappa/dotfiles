#!/bin/sh

brew update
brew install zsh
brew install zsh-completions
brew install tmux
brew install git
brew install rbenv
brew install libyaml
brew install libffi
brew install go
brew install the_silver_searcher
brew install wget
brew install ghq
brew install peco

brew tap homebrew/cask-fonts
brew install --cask font-ricty-diminished
brew install --cask visual-studio-code

brew upgrade
brew cleanup
