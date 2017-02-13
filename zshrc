# .zshrc
# vim: set tabstop=4 shiftwidth=4 noexpandtab

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# optional alternative formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(git extract colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export EDITOR=vim
export TERMINAL=termite
export BROWSER=chromium

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export SSH_KEY_PATH="~/.ssh/rsa_id"

# neet functions
dirsize () {
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null | egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm -rf /tmp/list
}

remindme() { sleep $1 && zenity --info --text "$2" & }

if which ruby &>/dev/null; then
	GEM_DIR=$(ruby -rubygems -e 'puts Gem.user_dir')/bin
	if [[ -d "$GEM_DIR" ]]; then
		export PATH=$PATH:$GEM_DIR
	fi
fi

# rvm
if [[ -d $HOME/.rvm ]]; then
	export PATH="$PATH:$HOME/.rvm/bin"
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

# android sdk
if [[ -d "/opt/android-sdk" ]]; then
	export ANDROID_HOME=/opt/android-sdk
fi

# chrome
if which google-chrome-stable &>/dev/null; then
	export CHROME_BIN=/usr/bin/google-chrome-stable
elif which chromium &>/dev/null; then
	export CHROME_BIN=/usr/bin/chromium
fi

# nvm
if [[ -f "/usr/share/nvm/nvm.sh" ]]; then
	source /usr/share/nvm/init-nvm.sh
fi

# aliases
alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
alias nosleep='xset s off -dpms'

# priviledged access
_isroot=false
[[ $UID -eq 0 ]] && _isroot=true
if ! $_isroot; then
	alias sudo='sudo '
	alias svim='sudo vim'
	alias reboot='sudo reboot'
	alias pacman='sudo pacman'
fi

