export DISPLAY=:0

CONFIG=~/.config

POLYBAR=$CONFIG/polybar
SCRIPT=~/scripts

/usr/bin/notify-send 'Syncing...!' 'Automated sync in progress' --icon=dialog-information

git add ~/.gitignore
git commit -m "Automated sync of ~/.gitignore"

cd $POLYBAR
git add config
git commit -m "Automated sync of $POLYBAR"

cd $SCRIPT
git add sync.sh
git commit -m "Automated sync of $SCRIPT"

git push origin master

