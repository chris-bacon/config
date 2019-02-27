export DISPLAY=:0

CONFIG=~/.config
POLYBAR=$CONFIG/polybar
SCRIPT=~/scripts
NVIM=$CONFIG/nvim
GITIGNORE=~/.gitignore
ALIASES=~/_functions.sh
FUNCTIONS=~/_functions.sh

/usr/bin/notify-send 'Syncing...!' 'Automated sync in progress' --icon=dialog-information

/usr/bin/git add $GITIGNORE
/usr/bin/git commit -m "Automated sync of $GITIGNORE"

cd $POLYBAR
/usr/bin/git add config
/usr/bin/git commit -m "Automated sync of $POLYBAR"

cd $SCRIPT
/usr/bin/git add sync.sh
/usr/bin/git commit -m "Automated sync of $SCRIPT"

cd $NVIM
/usr/bin/git add .
/usr/bin/git commit -m "Automated sync of $NVIM"

/usr/bin/git add $ALIASES
/usr/bin/git commit -m "Automated sync of $ALIASES"

/usr/bin/git add $FUNCTIONS
/usr/bin/git commit -m "Automated sync of $FUNCTIONS"

ssh-add ~/.ssh/github
/usr/bin/git push origin master

