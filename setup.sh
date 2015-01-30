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
files=(.zshrc .gitconfig .gitignore .rspec .vimrc .tmux.conf .inputrc .pryrc)
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
