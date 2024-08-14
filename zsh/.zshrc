# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

 #Path to your oh-my-zsh installation.
export PATH="/bin/yazi:$PATH"
export ZSH="$HOME/.oh-my-zsh"
# open up tmux with opening terminal

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.aliases.zshrc

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
source ~/shell/completion.zsh
source ~/shell/key-bindings.zsh
eval "$(zoxide init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"

if [ -z "$TMUX"  ] 
then
	{tmux attach ||exec ~/bash/setupTmux.sh}
fi
