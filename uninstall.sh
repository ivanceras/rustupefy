#!/bin/bash

## Undo install (at least trying to)
## This will not undo all, since it is a bit hard
## But this will as much as possible restore the previous state of vim and the terminal


## uninstall rust and cargo
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh -s -- --yes --uninstall



##Totally remove vim configurations
rm -rf $HOME/.vim
rm $HOME/.vimrc



## restore the backup
if [ -f $HOME/.rustupefy/.vimrc ]; then
    echo "Restoring $HOME/.vimrc"
    cp $HOME/.rustupefy/.vimrc $HOME/.vimrc
fi

if [ -d $HOME/rustupefy/.vim ]; then
    echo "Restoring $HOME/.vim"
    cp $HOME/.rustupefy/.vim $HOME/.vim
fi


## remove racer source code and binaries
if [ -d $HOME/Developer/racer ]; then
    echo "Rremoving racer"
    rm -rf $HOME/Developer/racer
fi

## remove rust-master source code
if [ -d $HOME/Developer/rust-master ]; then
    echo "Removing rust-master source code"
    rm -rf $HOME/Developer/rust-master
fi


## remove temporary powerline fonts
if [ -d /tmp/powerline ]; then
    echo "Removing /tmp/powerline"
    rm -rf /tmp/powerline
fi

##Change back the Default Profile of terminal font from command line
echo "Setting back terminal Default profile to use system font"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean true


