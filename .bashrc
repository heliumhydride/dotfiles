alias ls="ls --color"
alias youtube-dl="yt-dlp"
#alias sudo="doas"

export LESSHISTFILE="~/.cache/lesshst"
export PS1="\n[\e[35m\t\e[0m] [\e[31m\u\e[0m@\e[31m\h\e[0m] [\e[1;34m\w\e[0m]\n\$ "
export EDITOR="vim"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

PATH="$PATH:~/.local/bin:~/scripts"

#neofetch --ascii_distro alpine_small --color_blocks off
#COLOR="1;34" scripts/minifetch
ufetch
export PATH=/home/core4/.local/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:~/.local/bin:~/scripts:~/.local/bin:~/scripts
