#!/bin/zsh

configs=(zshenv zshrc zshprompt zssh zsh_functions zaws zlogout)
vim=(vim vimrc gvimrc)
for config in $configs
do
	cp $config ~/.$config
done

for config in $vim
do
	cp -r $config ~/.$config
done

sources=(zshenv zshrc)
for config in $sources
do
	echo "source ~/.$config"
done
