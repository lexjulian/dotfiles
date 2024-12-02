# Oh-my-zsh installation path
ZSH=/usr/share/oh-my-zsh/

# Powerlevel10k theme path
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect AUR wrapper
if pacman -Qi yay &>/dev/null; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null; then
            arch+=("${pkg}")
        else
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
alias c='clear' # clear terminal
alias l='eza -lh --icons=auto' # long list
alias ls='eza -x --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list available package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

# Personal aliases
alias cf='clear && fastfetch'
alias connectPhone='~/scripts/scrcpyUSB.zsh'
alias dumbass='~/scripts/my_commands.zsh'
alias tmux-clear='~/scripts/clear_panes.zsh'
alias yt='~/scripts/yt_download.sh'

# Custom functions

# Show and watch the most recent edited file in a directory
rec() {
  local dir="${1:-.}"
  watch -n 2 -t "echo 'Check file integrity for staging file in github:'; find \"$dir\" -type f -printf '%TY-%Tm-%Td %TH:%TM:%S %p\n' | sort -r | head -n 10"
}

# Automatically copy the location of the direction and converting the home/whoami to ~
c_pwd() {
  pwd | sed "s|$HOME|~|" | xclip -selection clipboard
}


# Connect to home server
ssh!() {
  local port="$1"
  local ip_file="${2:-$HOME/vault/.files/myHosts.txt}"  
  local line_num="${3:-1}" 
  # Check if the file exists
  if [[ ! -f $ip_file ]]; then
    echo "Error: IP address file not found at $ip_file"
    return 1
  fi

  # Get the IP from the specified line
  local ip=$(sed -n "${line_num}p" "$ip_file")

  # Validate that we got a valid IP
  if [[ -z $ip ]]; then
    echo "Error: No IP found at line $line_num in $ip_file"
    return 1
  fi

  # Connect via SSH
  ssh alexj@$ip -p "$port" -i ~/.ssh/capricorn-server
}

# Look for a specific word
fzf_highlight() {
  local word="$1"
  if [[ -z "$word" ]]; then
    echo "Usage: fzf-highlight WORD"
    return 1
  fi
  find . -type f | fzf --preview "bat --style=plain --color=always {} | grep -n --color=always '$word'" --preview-window=up:80%
}


# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fastfetch
