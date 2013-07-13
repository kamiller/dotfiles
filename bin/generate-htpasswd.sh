#!/bin/bash

printf "$1:$(openssl passwd -1 $2)\n" >> .htpasswd
