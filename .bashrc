#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

git_branch() {
    value=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$value" ]; then
        echo -e "\e[38;2;32;41;57m on \e[38;2;0;85;119m$value"
    fi
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -z "$DISPLAY" ]; then
    PS1='[\u@\h \W]\$ '
else
    PS1='( \[\e[38;2;0;85;119m\]\w$(git_branch)\[\e[0m\] ) 󰨃 '
fi
