#!/bin/env zsh

pwd=${PWD}

ln -sv $pwd/xinitrc $HOME/.xinitrc
ln -sv $pwd/yaourtrc $HOME/.yaourtrc
ln -sv $pwd/zshrc $HOME/.zshrc
mkdir -p $HOME/.config/i3 && ln -sv $pwd/config/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/i3status && ln -sv $pwd/config/i3status/config $HOME/.config/i3status/config
mkdir -p $HOME/.config/remmina && ln -sv $pwd/config/remmina/remmina.pref $HOME/.config/remmina/remmina.pref
mkdir -p $HOME/.config/termite && ln -sv $pwd/config/termite/config $HOME/.config/termite/config
ln -sv $pwd/config/redshift.conf $HOME/.config/redshift.conf
