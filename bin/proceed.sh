#!/bin/bash

ques="proceed"
if [ -n "$1" ]; then
  ques="$1"
fi

read -p "${ques}? [y/n]: " answer
if [[ $answer == "Y" || $answer == "y" || $answer = "" ]]; then
  exit 0
fi

echo "exiting..."
exit 1
