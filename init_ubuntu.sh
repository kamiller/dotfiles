#!/bin/bash

loc="$HOME/dotfiles"

if [ -d "${1}" ]; then
  loc="${1}"
  ln -sfiv ${loc} $HOME/dotfiles
fi

files=$(ls -A $HOME/dotfiles | grep -v -E -f $HOME/dotfiles/.initignore)

for file in $files; do
    ln -sfiv ${loc}/${file} $HOME/${file}
done
