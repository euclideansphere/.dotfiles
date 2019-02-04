#!/usr/bin/env bash

pwd=${PWD}

# oh my zsh
if [ ! -d "$ZSH" ]; then
	echo "installing oh-my-zsh"
	export ZSH="$HOME/.dotfiles/oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ "$SHELL" != "/bin/zsh" ]; then
	echo "setting default shell to zsh"
	chsh -s /bin/zsh
fi

if [ "$(uname)" == "Darwin" ]; then
	echo "running Darwin install"

	if [ ! -h "$HOME/.zshrc" ]; then
		mv "$HOME/.zshrc" "$HOME/.zshrc.pre-dotfiles-setup"
	fi

	ln -sv $pwd/zshrc $HOME/.zshrc

else
	echo "running linux install"

	ln -sv $pwd/zshrc $HOME/.zshrc
	ln -sv $pwd/xinitrc $HOME/.xinitrc
	ln -sv $pwd/yaourtrc $HOME/.yaourtrc
	mkdir -p $HOME/.config/i3 && ln -sv $pwd/config/i3/config $HOME/.config/i3/config
	mkdir -p $HOME/.config/i3status && ln -sv $pwd/config/i3status/config $HOME/.config/i3status/config
	mkdir -p $HOME/.config/remmina && ln -sv $pwd/config/remmina/remmina.pref $HOME/.config/remmina/remmina.pref
	mkdir -p $HOME/.config/termite && ln -sv $pwd/config/termite/config $HOME/.config/termite/config
	ln -sv $pwd/config/redshift.conf $HOME/.config/redshift.conf

fi

echo "done"

