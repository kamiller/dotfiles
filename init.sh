#!/bin/bash

loc="~/dotfiles"

if [ -d "${1}" ]; then
  loc="${1}"
  ln -sFivh ${loc} ~/dotfiles
fi

files=$(ls -A ~/dotfiles | grep -v -E -f ~/dotfiles/.initignore)

for file in $files; do
    ln -sFivh ${loc}/${file} ~/${file}
done
