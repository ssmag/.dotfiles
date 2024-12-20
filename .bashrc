# Welcome message
if [[ ! "$TERM" =~ "xterm-256color" ]]; then
	echo
 	# Start tmux
# 	if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#		echo "TMUX RUNNING"
#	else
#		echo "TMUX NOT RUNNING"
# 	fi
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Set urxvt to fullscreen
if command -v wmctrl &> /dev/null; then
	wmctrl -r x-terminal-emulator -b add,fullscreen
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   
	#No color
	PS1='${debian_chroot:+($debian_chroot)}\u@\t \W \$'
	#Overlapping color
	#PS1='${debian_chroot:+($debian_chroot)}\e\[[1;32m[\u@\t \W] \$\e\[\]\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\d \u@\h: \W\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# TODO: FIND OUT WHY THE FUCK THIS DOES NOT WORK
# init thefuck
# eval "$(thefuck --alias)"
# eval "$(thefuck --alias fuck)"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set JAVA_HOME environment variable


# TODO CHECK OS INSTALLATION AND ASSIGN JAVA_HOME ACCORDINGLY
# JAVA HOME ON UBUNTU
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.15.1.jdk/Contents/Home

# JAVA HOME ON MACOS

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

export ANDROID_NDK=~/Android/Sdk/ndk/20.1.5948944/
export ANDROID_SDK=~/Android/Sdk/build-tools/29.0.2/
export DISCORD_PATH=~/programs/Discord/
export FLUTTER_PATH=~/development/flutter/bin
export SNYK_PATH=~/Snyk
export BUILD_TOOLS_PATH=~/Library/Android/sdk/build-tools/34.0.0
export DOTNET_ROOT=$HOME/dotnet
# TODO: Change CARGO_PATH TO NOT SHOW EXPLICIT HOME DIRECTORY
# export CARGO_PATH=/home/th0r/.cargo/bin

# JRE_HOME IS INCORRECT. GOTTA FIND RIGHT PATH AGAIN
# export JRE_HOME=/usr/share/gdb/auto-load/usr/lib/jvm/java-12-openjdk-amd64/jre
# PATH = $PATH:$HOME/bin:$JAVA_HOME/bin:$DISCORD_PATH
# PATH=$PATH:$CARGO_PATH
PATH=$PATH:$HOME/bin:$DISCORD_PATH
PATH=$PATH:$FLUTTER_PATH
PATH=$PATH:$SNYK_PATH
PATH=$PATH:$BUILD_TOOLS_PATH
PATH=$PATH:$DOTNET_ROOT

export PATH
export bin=/usr/local/bin

# Set detault editor

export EDITOR=vi
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# SYNOPSIS
#   manopt command opt
#
# DESCRIPTION
#   Returns the portion of COMMAND's man page describing option OPT.
#   Note: Result is plain text - formatting is lost.
#
#   OPT may be a short option (e.g., -F) or long option (e.g., --fixed-strings);
#   specifying the preceding '-' or '--' is OPTIONAL - UNLESS with long option
#   names preceded only by *1* '-', such as the actions for the `find` command.
#
#   Matching is exact by default; to turn on prefix matching for long options,
#   quote the prefix and append '.*', e.g.: `manopt find '-exec.*'` finds
#   both '-exec' and 'execdir'.
#
# EXAMPLES
#   manopt ls l           # same as: manopt ls -l
#   manopt sort reverse   # same as: manopt sort --reverse
#   manopt find -print    # MUST prefix with '-' here.
#   manopt find '-exec.*' # find options *starting* with '-exec'
manopt() {
  local cmd=$1 opt=$2
  [[ $opt == -* ]] || { (( ${#opt} == 1 )) && opt="-$opt" || opt="--$opt"; }
  man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# TODO: Change anaconda setup to not represent any actual home directory
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/th0r/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/th0r/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/th0r/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/th0r/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# This sets up urxvt
if [[ ! $(uname) =~ "Darwin" ]]; then
	loadXdefaults
fi

[ -f ~/.fzf.bash ] && eval "$(fzf --bash)" && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"

export GOOGLE_APPLICATION_CREDENTIALS=~/Documents/google-app-amc-plus-dev-credentials.json

# TO BE CHANGED
#export DEVICE_NAME="AMC-MC5G7504RF6"

# JFROG STUFF
export JFROG_USERNAMECIRCL="circlecitest"
export FIRETV_SERIALNO=G071R20721730GGD
export ANDROIDTV_SERIALNO=24211HFDD666B7
