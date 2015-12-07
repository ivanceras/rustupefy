## Rustupefy!
![stupefy](https://raw.githubusercontent.com/ivanceras/rustupefy/master/reference/stupefy2.jpg)

[![Build Status](https://api.travis-ci.org/ivanceras/rustupefy.svg)](https://travis-ci.org/ivanceras/rustupefy)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)

A series of scripts to automagically transform vim into a stunningly beautiful and fast IDE for rust

**From this**
![simple vim](https://raw.githubusercontent.com/ivanceras/rustupefy/master/bare_vim.png)

**To this**
![installed](https://raw.githubusercontent.com/ivanceras/rustupefy/master/vim_complete.png)

**And crazy responsive like this**
![action](https://raw.githubusercontent.com/ivanceras/rustupefy/master/vim_action.gif)

This script is aim to jumpstart non-vim users to be able to use vim minimally configured for rust code development.

**If you have been using vi before, this script might probably not for you**

## Installing

```sh
sudo apt-get install curl

curl -sSf https://raw.githubusercontent.com/ivanceras/rustupefy/master/setup.sh | sh

```

## To update, run the same script as above

```sh

curl -sSf https://raw.githubusercontent.com/ivanceras/rustupefy/master/setup.sh | sh

```

## You don't like it?

```sh

curl -sSf https://raw.githubusercontent.com/ivanceras/rustupefy/master/uninstall.sh | sh

```

The script will undo as much as it can, but not guaranteed as it was before.


## What are the plugins installed
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [rust.vim](https://github.com/rust-lang/rust.vim)
- [vim-airline](https://github.com/bling/vim-airline)
- [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
- [vim-racer](https://github.com/racer-rust/vim-racer)

## I wanna learn it step-by-step.

**[Here is how is it done manually](https://github.com/ivanceras/rust-vim-setup)**



# Basic Controls
	CTRL-t 			open or close nerdtree
	CTRL-n 			toggle relative / absolute numbering
	CTRL-w w 		switch focus on nerdtree and open windows
	h,j,k,l			navigate the cursor left, down, up, right respectively
	i				insert mode, you can start typing in your code
	<ESC>   		gp back to normal/default mode, where you can issue vi commands
	:w      		write/save the file, you are editing
	:wqa   			save the file, then quit the editor closing vi including the files tab
	<F2>			set focus on the nerd tree

## Rust specific commands
	CTRL-x CTRL-o   activate auto rust autocompeletion (example: type in `String::` then press CTRL-x CTRL-o then select from the drop down list the appropriate functions)
	gd				go to function/struct/variable declaration of the focused item ( this is equivalent to eclipse' open declaration )
	gD				go to declaration split open in window tab
	:bp				to go back to the previous edited file (very useful when following a declaration)
	:b <part of filename>  when you have open a lot of files, this comes in handy in showing back the previously open files

## Where to go from here

[A more comprehensive List of VIM commands](https://github.com/ivanceras/rust-vim-setup/blob/master/VIM_Notes.md)


