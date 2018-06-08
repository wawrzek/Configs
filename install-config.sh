#!/bin/zsh
configs=(zshenv zshrc zshprompt zssh zsh_functions zaws zlogout)
for config in $configs
do
	cp $config ~/.$config
done

sources=(zshenv zshrc)
for config in $sources
do
	echo "source ~/.$config"
done
