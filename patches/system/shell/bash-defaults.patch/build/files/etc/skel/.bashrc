# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
BLUE='\[\033[1;34m\]'
GREEN='\[\033[1;32m\]'
NC='\[\033[0m\]'
PS1="[${BLUE}\u${NC}@${GREEN}\h${NC} \W]\\$ "
#PS1="[${BLUE}\u${NC}@${GREEN}\h${NC} \W]\$ "
##PS1='[${BLUE}\u${NC}@${GREEN}\h${NC} \W]\$ '
##PS1="^[[96m'$(hostname)'<^[[92m${PWD}^[[96m>^[[97m "

#PS1='\[\033[01;34m\]\u@\h'
#PS1='\[\033[01;34m\]\u@\[\033[01;32m\]\h'

#http://xjonquilx.co.cc/2011/11/03/how-to-color-code-your-terminal-in-gnome-shell-3-x/
#PS1=’${debian_chroot:+($debian_chroot)}\\[\033[0;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ‘

alias ls='ls --color=auto'
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

# setup an alias for apropos since the name is non-intuitive
alias man-search='apropos'

# http://www.tuxarena.com/2012/04/tutorial-colored-man-pages-how-it-works/
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

#export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
#export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
#export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
#export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
#export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
#export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# set default editor as nano
# @TODO: this depends on installing nano
export EDITOR=nano
