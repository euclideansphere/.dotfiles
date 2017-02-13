#!/bin/env zsh

ln -sv xinitrc $HOME/.xinitrc
ln -sv yaourtrc $HOME/.yaourtrc
ln -sv zshrc $HOME/.zshrc
mkdir -p $HOME/.config/i3 && ln -sv config/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/i3status && ln -sv config/i3status/config $HOME/.config/i3status/config
mkdir -p $HOME/.config/remmina && ln -sv config/remmina/remmina.pref $HOME/.config/remmina/remmina.pref
mkdir -p $HOME/.config/termite && ln -sv config/termite/config $HOME/.config/termite/config

