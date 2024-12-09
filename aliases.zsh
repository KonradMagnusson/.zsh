function alias_if_exists() {
	if defined $1; then
		alias $2
	fi
}

{
	alias vim=nvim
}

{
	alias cp='cp -i'
	alias mv='mv -i'
	alias rm='rm -i'
}

{
	alias ls='eza -l --group-directories-first --no-user'
	alias c='echo -ne "\033c"'
	alias cl='echo -ne "\033c"; ls'
	alias cla='echo -ne "\033c"; ls -a'
	alias_if_exists 'tree' cs='echo -ne "\033c"; tree'
	alias_if_exists 'tree' csa='echo -ne "\033c"; tree -a'
}

{
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
}

{
	alias pn="pushd ~/.config/nvim"
	alias pz="pushd ~/.zsh"
	alias cda="cd ~/proj/A/marius"
	alias cdb="cd ~/proj/B/marius"
	alias cdd="cd ~/proj/develop/marius"
	alias cdw="cd ../cw"
}

function loc()
{
	start="."
	if [[ ! -z $1 && -d $1 ]];
		then start=$1;
	fi

	find_cmd="find $start -xdev -print 2>/dev/null"

	if defined "fd"; then
		find_cmd="fd -L -j $(nproc --ignore 2)"
	fi

	if defined "sk"; then
		dir=$(find $start -xdev -print 2>/dev/null | sk)
	else
		dir=$(find $start -xdev -print 2>/dev/null | fzf)
	fi

	if [[ -z $dir ]]; then
		return
	fi

	if [[ ! -d $dir ]]; then
		dir=$(dirname $dir);
	fi

	pushd $dir
}

function mcd()
{
	install -d $1
	pushd $1
}
