#!/bin/zsh

function copy_config () {
for config in $@
do
	echo Copying $config
	cp $config ~/.$config
done
}

zsh_configs=(zshenv zshrc zshprompt zssh zsh_functions zaws zazure zlogout)
vim_configs=(vimrc gvimrc)
git_configs=(gitignore gitconfig)

copy_config $zsh_configs $vim_configs $git_configs

echo "Copying vim directory"
VIMDIR=~/.vim
if [ ! -d  $VIMDIR ]
then
	if [ -e  $VIMDIR ]
	then
		rm -f $VIMDIR
	fi
	mkdir $VIMDIR
fi
cp -R vim/ $VIMDIR

sources=(zshenv zshrc)
for config in $sources
do
	echo "source ~/.$config"
done
