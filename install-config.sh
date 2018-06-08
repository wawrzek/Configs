#!/bin/zsh
set -x
configs=(zshrc zshenv zshprompt zssh zsh_functions zlogout)
for config in $configs
do
	cp $config ~/.$config
done
