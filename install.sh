#!/bin/bash

backup ()
{
  echo -n "[+] Checking $1: "
  if test -h $1
  then
    echo "Copy from symlink and unlink"
    cp -r $1 $2
    rm $1
  elif test -d $1
  then
     echo "Moving directory"
     mv $1 $2
  elif test -f $1
  then
     echo "Moving file"
     mv $1 $2
  else
     echo "File not found..."
  fi
}

BACKUP="$HOME/.dotfiles_backup/$(date +%s)"
if ! test -d $BACKUP
then
  mkdir $BACKUP
fi

# do NOT use tailing /'s
echo "[+] Moving old configuration files to $BACKUP"
backup "$HOME/.bashrc" $BACKUP
backup "$HOME/.vim" $BACKUP
backup "$HOME/.vimrc" $BACKUP

echo -n "[+] Creating symlinks:"

echo -n " bash"
ln -s $PWD/.bashrc $HOME/.bashrc

echo -n " vim"
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.vim/ $HOME/.vim/

echo " done!"
