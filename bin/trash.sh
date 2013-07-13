#!/bin/bash
if [ -e "$*" ]
then
  CUR=`date "+%y-%m-%d--%H-%M-%S"`
  mkdir -p ~/.Trash/$CUR
  #echo `pv $*`
  mv "$*" ~/.Trash/$CUR > /dev/null 2>&1
  #echo move status $?
  case $? in
  1)
    echo "Move FAILED..."
    ;;
  *)
    echo "Moving Files to $CUR in the Trash."
    ;;
  esac
else
  echo "$* does not exist"
fi
