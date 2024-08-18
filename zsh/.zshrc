# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

 #Path to your oh-my-zsh installation.
export PATH="/bin/yazi:$PATH"
export ZSH="$HOME/.oh-my-zsh"
# open up tmux with opening terminal

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/dotfiles/aliases/.aliases

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
# export FZF_DEFAULT_COMMAND="find . -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
# export FZF_DEFAULT_COMMAND='--hidden --files '"'"'!.git/'"'"
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
eval "$(zoxide init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"

if [ -z "$TMUX"  ] 
then
	{tmux attach ||exec ~/dotfiles/scripts/setupTmux.sh}
fi
