#!/bin/bash

# Rustupefy
# A series of scripts to automagically transform vim into a stunningly beautiful and fast IDE for rust

##Update the system
sudo xbps-install -Sy

## Install build-essential
sudo xbps-install base-devel -y

## Install vim
sudo xbps-install vim-huge -y
## Install git
sudo xbps-install git -y
## Install curl
sudo xbps-install curl -y

## Create a .rustupefy directory for backup of original vim configuration
mkdir -p $HOME/.rustupefy

## backup existing .vimrc if there is
if [ -f $HOME/.vimrc ]; then 
    echo "backing up existing .vimrc file to .vimrc_rustupefy_backup"
    cp $HOME/.vimrc $HOME/.rustupefy/.vimrc
else
    echo "no existing .vimrc configuration file"
fi

##back existing .vim directory
if [ -d $HOME/.vim ]; then
    cp -r $HOME/.vim $HOME/rustupefy/.vim
else
   echo "no existing .vim directory" 
fi

## make vim directories
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle $HOME/.vim/plugin/

## install pathogen
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## go to working directory
cd $HOME/.vim/bundle

## Update or install

## copy the vimrc file
curl -LSso $HOME/.vimrc https://raw.githubusercontent.com/ivanceras/rustupefy/master/vimrc

## update or install nerdtree PLUGIN #1
if [ -d $HOME/.vim/bundle/nerdtree ]; then
    echo "Updating existing nerdtree plugin"
    cd $HOME/.vim/bundle/nerdtree/
    git pull
else
    echo "Installing nerdtree plugin"
    git clone --depth 1 --branch master https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree/
fi

## update or install rust.vim PLUGIN #2
if [ -d $HOME/.vim/bundle/rust.vim ]; then
    echo "Updating existing rust.vim"
    cd $HOME/.vim/bundle/rust.vim/
    git pull
else
    echo "Installing rust.vim plugin"
    git clone --depth 1 --branch master https://github.com/rust-lang/rust.vim.git $HOME/.vim/bundle/rust.vim
fi

## update or install vim-airline PLUGIN #3
if [ -d $HOME/.vim/bundle/vim-airline ]; then
    echo "Updating existing vim-airline plugin"
    cd $HOME/.vim/bundle/vim-airline/
    git pull
else
    echo "Installing vim-airline plugin"
    git clone --depth 1 --branch master https://github.com/bling/vim-airline $HOME/.vim/bundle/vim-airline
fi

## update or install vim-numbertoggle PLUGIN #4
if [ -d $HOME/.vim/bundle/vim-numbertoggle ]; then
    echo "Updating existing $HOME/.vim/bundle/vim-numbertoggle plugin"
    cd $HOME/.vim/bundle/vim-numbertoggle/
    git pull
else
    echo "Installing vim-numbertoggle plugin"
    git clone --depth 1 --branch master git://github.com/jeffkreeftmeijer/vim-numbertoggle.git $HOME/.vim/bundle/numbertoggle
fi


## update vim-racer PLUGIN #5
curl -LSso $HOME/.vim/plugin/racer.vim https://raw.githubusercontent.com/racer-rust/vim-racer/master/ftplugin/rust_racer.vim

## install rust and cargo, using rustup and using stable as the default toolchain
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y


# make a Developer directory
mkdir -p $HOME/Developer/

##update racer and build racer
if [ -d $HOME/Developer/racer ]; then
    echo "Updating existing racer source code"
    cd $HOME/Developer/racer
    git pull
    cargo build --release
else
    echo "Cloning racer source code"
    git clone --depth 1 --branch master https://github.com/phildawes/racer $HOME/Developer/racer
    cd $HOME/Developer/racer
    cargo build --release
fi


##git pull or clone rust-master
if [ -d $HOME/Developer/rust-master ]; then
    echo "Updating existing rust master source code"
    cd $HOME/Developer/rust-master
    git pull
else
    echo "shallow cloning rust master source code"
    ## checkout rust source code only the master branch with shallow history
    git clone --depth 1 --branch master https://github.com/rust-lang/rust $HOME/Developer/rust-master    
fi

## Append the checkout folder to .vimrc ,since it's hard to set it programmatically in .vimrc (getting the home directory)

echo "let \$RUST_SRC_PATH=\"`echo $HOME`/Developer/rust-master/src/\"" >> $HOME/.vimrc
echo "let g:racer_cmd=\"`echo $HOME`/Developer/racer/target/release/racer\"" >> $HOME/.vimrc


## Install the powerline fonts uses in vim-airline

mkdir -p /tmp/powerline/
git clone --depth 1 --branch master https://github.com/powerline/fonts /tmp/powerline/fonts
sh /tmp/powerline/fonts/install.sh

