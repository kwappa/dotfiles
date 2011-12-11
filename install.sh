#!/bin/sh
files=(.zshrc .screenrc .gitconfig .gitignore .rspec .autotest .vimrc .tmux.conf .inputrc)
num=${#files[@]}
i=0
while (($i<$num))
do
  echo ${files[$i]}
  ln -s `pwd`/${files[$i]} ~/${files[$i]}
  i=$i+1
done

if [[ ! -d $HOME/\.autotest\.d ]] ; then
  mkdir $HOME/.autotest.d
  autotest_imgs=(rails_fail.png rails_ok.png rails_pending.png)
  num=${#autotest_imgs[@]}
  i=0
  echo $num
  while (($i<$num))
  do
      echo ${autotest_imgs[$i]}
      wget http://cocooooooon.com/kinotan/${autotest_imgs[$i]} -O $HOME/.autotest.d/${autotest_imgs[$i]}
      i=$i+1
  done
fi
