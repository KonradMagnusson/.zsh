function include() {
	if [ ! -f $1 ]; then
		print "Missing include: $1"
		return
	fi
	source $1
}

function defined() {
    return $(type $1 > /dev/null)
}

include ~/.zsh/aliases.zsh
include ~/.zsh/options.zsh
include ~/.zsh/hooks.zsh
include ~/.zsh/prompt.zsh
include ~/.zsh/completion.zsh
include ~/.zsh/aur_helper.zsh # after completion (registers completion for the aur helper)
include ~/.zsh/env.zsh

include ~/.zsh/git.zsh

if [ -f ~/.LS_COLORS ]; then
	eval $(dircolors -b ~/.LS_COLORS)
fi

unset -f defined
