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

case $mode in
    install)
        echo 'install'
        ;;
    uninstall)
        echo 'uninstall'
        ;;
    *)
        echo "invalid command ${mode}"
        exit
esac

for src in `\find config -maxdepth 1 -type f`; do
  file="${src//config``\//}"
  symlink="${HOME}/${file}"
  if [ $mode = 'install' ]; then
      echo "link ${src} to ${symlink}"
      ln -s "`pwd`/${src}" $symlink
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
done
