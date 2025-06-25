#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -n "$DISPLAY" ]; then
    PS1='┌——  \[\e[38;2;0;142;199m\]\u\[\e[0m\] at \[\e[38;2;0;142;199m\]\h\[\e[0m\] in \[\e[38;2;0;142;199m\]\W \[\e[38;2;138;255;58m\]$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\[\e[0m\] \n└—  λ '
fi

function trash() {
    if [ "$(basename "$(pwd)")" == ".trash" ]; then
        echo "trash: should not be in the '.trash' folder"
        return 1
    fi
    if [ "$#" -eq 0 ]; then
        echo "trash: no directory or file specified"
        return 1
    fi
    mkdir -p "$HOME/.trash"
    for item in "$@"; do
        if [ -e "$item" ]; then
            mv "$item" "$HOME/.trash"
        else
            echo "trash: $item: directory or file not found"
        fi
    done
}

function trash_restore() {
    if [ "$(basename "$(pwd)")" != ".trash" ]; then
        echo "trash_restore: must be in the '.trash' folder"
        return 1
    fi
    if [ "$#" -eq 0 ]; then
        echo "trash_restore: no directory or file specified"
        return 1
    fi
    read -p "Enter the destination directory: " destination_dir
    if [ -z "$destination_dir" ]; then
        echo "trash_restore: you must enter a destination directory"
        return 1
    fi
    local destination_dir=$(eval echo "$destination_dir")
    mkdir -p "$destination_dir"
    for item in "$@"; do
        if [ -e "$item" ]; then
            mv "$item" "$destination_dir"
        else
            echo "trash_restore: $item: directory or file not found"
        fi
    done
}
