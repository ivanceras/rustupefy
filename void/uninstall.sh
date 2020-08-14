#!/bin/bash

## Undo install (at least trying to)
## This will not undo all, since it is a bit hard
## But this will as much as possible restore the previous state of vim and the terminal


## uninstall rust and cargo
~/.cargo/bin/rustup self uninstall

##Totally remove vim configurations
rm -rf $HOME/.vim
rm $HOME/.vimrc

## restore the backup
if [ -f $HOME/.rustupefy/.vimrc ]; then
    echo "Restoring $HOME/.vimrc"
    cp $HOME/.rustupefy/.vimrc $HOME/.vimrc
fi

if [ -d $HOME/.rustupefy/.vim ]; then
    echo "Restoring $HOME/.vim"
    cp -r $HOME/.rustupefy/.vim $HOME/.vim
    rm -rf $HOME/.rustupefy
fi

## remove racer source code and binaries
if [ -d $HOME/Developer/racer ]; then
    echo "Rremoving racer"
    rm -rf $HOME/Developer/racer
fi

## remove rust-master source code
if [ -d $HOME/Developer/rust-master ]; then
    echo "Removing rust-master source code"
    rm -rf $HOME/Developer
fi

## remove temporary powerline fonts
if [ -d /tmp/powerline ]; then
    echo "Removing /tmp/powerline"
    rm -rf /tmp/powerline
fi
