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

commit() {
  git commit -m "Automated sync of $1"
}

/usr/bin/notify-send 'Syncing...!' 'Automated sync in progress' --icon=dialog-information

git add $GITIGNORE
commit $GITIGNORE

git add $SCRIPT
commit $SCRIPT

git add $ALIASES
commit $ALIASES

git add $FUNCTIONS
commit $FUNCTIONS

cd $POLYBAR
git add config
commit $POLYBAR

cd $NVIM
git add .
commit $NVIM

cd $I3
git add .
commit $I3

eval "$(ssh-agent)"
ssh-add ~/.ssh/github
git push origin master

