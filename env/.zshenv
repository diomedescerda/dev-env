export EDITOR="nvim" 
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

export PATH="/opt/idea-IU-242.23339.11/bin:$PATH"

addToPath() {
    if [[  "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPath $HOME/.local/scripts

bindkey -s ^f "tmux-sessionizer\n"
