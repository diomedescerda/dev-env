export EDITOR="nvim" 
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/opt/idea-IU-242.23339.11/bin:$PATH"

addToPath() {
    if [[  "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPath $HOME/.local/scripts

bindkey -s ^f "tmux-sessionizer\n"
