#!/bin/bash

[ "$(ls -A ${1})" ] && exit 0 || exit 1
