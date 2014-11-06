#!/bin/sh

if [ $# -ne 1 ]; then
    echo "usage:"
    echo "  setup.sh [command]"
    echo "command:"
    echo "    install : create symlinks from here to your home directory."
    echo "  uninstall : remove symlinks from your home directory."
    exit
fi

mode=$1
files=(.zshrc .screenrc .gitconfig .gitignore .rspec .autotest .vimrc .tmux.conf .inputrc .pryrc)
num=${#files[@]}
i=0

case $mode in
    install)
        echo 'uninstall'
        ;;
    uninstall)
        echo 'uninstall'
        ;;
    *)
        echo "invalid command ${mode}"
        exit
esac

while (($i<$num))
do
  symlink=~/${files[$i]}
  if [ $mode = 'install' ]; then
      echo "link ${symlink}"
      ln -s `pwd`/${files[$i]} $symlink
  elif [ $mode = 'uninstall' ]; then
      if [ -L $symlink ]; then
          rm $symlink
          echo "unlink ${symlink}"
      else
          echo "${symlink} is not symlink"
      fi
  else
      echo "nothing for ${symlink}"
  fi
  i=$i+1
done

if [ ! $mode = 'install' ]; then
    exit
fi

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
