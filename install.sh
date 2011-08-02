#!/bin/sh
files=(.zshrc .screenrc .gitconfig .gitignore .rspec)
num=${#files[@]}
i=0
while (($i<$num))
do
  echo ${files[$i]}
  ln -s `pwd`/${files[$i]} ~/${files[$i]}
  i=$i+1
done
