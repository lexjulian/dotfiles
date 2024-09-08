#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#custom script
alias clear='~/scripts/clear_and_fetch.sh'
alias dumbass='~/scripts/my_commands.sh'
alias web='~/scripts/webdev_commands.sh'

neofetch
