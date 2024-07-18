#!/usr/bin/env bash
set -Eeo pipefail

#symlinks
for i in $(find . -name ".*" -maxdepth 1 -type f -not -path ".git/*" | sed "s|^\./||"); do
   ln -sf ~/Documents/dotfiles/$i ~/$i
done

#custom ozsh directory
#rm -rf ~/.oh-my-zsh/custom/.git/
cd ~/.oh-my-zsh/custom
git init
git add .
git commit -m "stash existing stuff just in case it's not the default"
git remote add origin git@github.com:knzai/dotfiles.git
git fetch origin
git reset origin/ozsh
git switch -c ozsh --track origin/ozsh
