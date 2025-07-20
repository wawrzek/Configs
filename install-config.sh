#!/usr/bin/env zsh

function copy_config () {
for config in $@
do
	echo Copying $config
	cp $config ~/.$config
done
}

zsh_configs=(zshenv zlogout zsh_functions zssh zzsh_$(uname) aws zazure zgcp)
vim_configs=(vimrc gvimrc)
git_configs=(gitignore)
special_configs=(zshrc gitconfig)
# Not idea to copy gitconfig or zshrc, because of local changes
# TODO: print diff and ask if to apply
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
