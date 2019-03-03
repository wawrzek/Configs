#!/bin/zsh

function copy_config () {
for config in $1
do
	cp -r $config ~/.$config
done
}

zsh_configs=(zshenv zshrc zshprompt zssh zsh_functions zaws zlogout)
vim_configs=(vim vimrc gvimrc)
git_configs=(gitignore gitconfig)

copy_config $zsh_configs
copy_config $vim_configs
copy_config $git_configs

sources=(zshenv zshrc)
for config in $sources
do
	echo "source ~/.$config"
done
