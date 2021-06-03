#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# User specific aliases and functions
# ~/bin PATH

export PATH="${PATH}:/home/bma/bin"

# sudo autocompletion
complete -cf sudo

# force_color_prompt=yes
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# tabs
tabs -4

# vte
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_prompt_command
fi

# qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct
