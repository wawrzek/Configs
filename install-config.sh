#!/bin/zsh

function copy_config () {
for config in $@
do
	echo Copying $config
	cp -r $config ~/.$config
done
}

zsh_configs=(zshenv zshrc zshprompt zssh zsh_functions zaws zlogout)
vim_configs=(vim vimrc gvimrc)
git_configs=(gitignore gitconfig)

copy_config $zsh_configs $vim_configs $git_configs

sources=(zshenv zshrc)
for config in $sources
do
	echo "source ~/.$config"
done
