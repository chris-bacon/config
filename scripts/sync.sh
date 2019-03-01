#!/bin/bash
export DISPLAY=:0

# DIRS
CONFIG=~/.config
POLYBAR=$CONFIG/polybar
NVIM=$CONFIG/nvim
I3=$CONFIG/i3

# FIlES
SCRIPT=~/scripts/sync.sh
GITIGNORE=~/.gitignore
ALIASES=~/_functions.sh
FUNCTIONS=~/_functions.sh
CRON=~/scripts/mycrontab
GHCI=~/.ghci
README=~/README.md

FILES=($SCRIPT $GITIGNORE $ALIASES $FUNCTIONS $CRON $GHCI $README)

autoCommit() {
  git commit -m "Automated sync of $1"
}

/usr/bin/notify-send 'Syncing...!' 'Automated sync in progress' --icon=dialog-information --urgency=low

for i in "${FILES[@]}"
do
    git add $i
    autoCommit $i
done

cd $POLYBAR
git add config
autoCommit $POLYBAR

cd $NVIM
git add .
autoCommit $NVIM

cd $I3
git add .
autoCommit $I3

eval "$(ssh-agent)"
ssh-add ~/.ssh/github
git push origin master

