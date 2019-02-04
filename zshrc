# .zshrc
# vim: set tabstop=4 shiftwidth=4 noexpandtab

export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:$PATH

export DOTFILES="$HOME/.dotfiles"

# Path to your oh-my-zsh installation
export ZSH="$HOME/.dotfiles/oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

# optional alternative formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
	colored-man-pages
	extract
	git
	vi-mode
)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export EDITOR=vim

export SSH_KEY_PATH="~/.ssh/rsa_id"

if which ruby &>/dev/null; then
	GEM_DIR=$(ruby -rubygems -e 'puts Gem.user_dir')/bin
	if [[ -d "$GEM_DIR" ]]; then
		export PATH=$PATH:$GEM_DIR
	fi

	eval "$(hub alias -s)"

	[[ -s "/usr/local/share/chruby/chruby.sh" ]] && source /usr/local/share/chruby/chruby.sh
	[[ -s "/usr/local/share/chruby/auto.sh" ]] && source /usr/local/share/chruby/auto.sh
	#chruby ruby-2.6.1

	# rvm
	if [[ -d $HOME/.rvm ]]; then
		# add rvm to path for scripting
		export PATH="$PATH:$HOME/.rvm/bin"
		#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
	fi
fi


if [ "${uname}" = "Darwin" ]; then

else
	export TERMINAL=termite
	export BROWSER=firefox-developer-edition

	# Compilation flags
	export ARCHFLAGS="-arch x86_64"

	# chrome
	if which google-chrome-stable &>/dev/null; then
		export CHROME_BIN=/usr/bin/google-chrome-stable
	elif which chromium &>/dev/null; then
		export CHROME_BIN=/usr/bin/chromium
	fi

	# aliases
	alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
	alias nosleep='xset s off -dpms'
	alias setbrightness='xrandr --output eDP-1 --brightness'

	# priviledged access
	_isroot=false
	[[ $UID -eq 0 ]] && _isroot=true
	if ! $_isroot; then
		alias sudo='sudo '
		alias svim='sudo vim'
		alias reboot='sudo reboot'
		alias pacman='sudo pacman'
	fi
fi

source $ZSH/oh-my-zsh.sh

