#!/usr/bin/env bash
set -Eeo pipefail

for i in $(find . -name ".*" -maxdepth 1 -type f -not -path ".git/*" | sed "s|^\./||"); do
   ln -sf ~/Documents/dotfiles/$i ~/$i
done