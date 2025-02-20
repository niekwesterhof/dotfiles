# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#Path to your oh-my-zsh installation.
export PATH="/bin/yazi:$PATH"
export ZSH="$HOME/.oh-my-zsh"
# open up tmux with opening terminal
export PATH="/etc/default:$PATH"
# plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/dotfiles/aliases/aliases.sh

# ~/.zshrc

function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

eval "$(starship init zsh)"
# Set up fzf key bindings and fuzzy completion
source ~/dotfiles/zsh/completion.zsh
source ~/dotfiles/zsh/key-bindings.zsh
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export STARSHIP_CONFIG=~/.config/starship.toml
# export FZF_DEFAULT_COMMAND="find . -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
# export FZF_DEFAULT_COMMAND='--hidden --files '"'"'!.git/'"'"
# export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
eval "$(zoxide init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

if [ -z "$TMUX" ]; then
    {tmux attach || sh ~/dotfiles/scripts/setupTmux.sh}
fi

# Created by `pipx` on 2024-10-10 13:14:23
export PATH="$PATH:/home/niek/.local/bin"
autoload -Uz compinit
compinit
