#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

#custom script
#alias clear='~/scripts/clear_and_fetch.sh'
alias clearf='clear && neofetch'
alias dumbass='~/scripts/my_commands.sh'
alias phoneWIFI='~/scripts/ScrcpyWIFI_GTK.sh'
alias phoneUSB='~/scripts/scrcpyUSB.sh'
alias q~='shutdown -h now'
alias tmux-react='tmux attach-session -t react-directory'
alias web='~/scripts/webdev_commands.sh'

#functions
rec() {
  local dir="${1:-.}"
  nvim $(find "$dir" -type f -printf "%T+ %p\n" | sort -r | fzf -m --preview='bat --color=always {}' | awk '{print substr($0, index($0,$2))}')
}

neofetch


