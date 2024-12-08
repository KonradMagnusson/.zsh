# git status in prompt
# Find and set branch name var if in git repository.
function git_branch_name()
{
	cwbranch=""
	if [[  "$(pwd)" =~ .*"/caligula\b".* ]]; then
		cwdir="$(pwd | sed 's/caligula.*/cw/')"
		pushd "$cwdir"
		cwbranch=$(git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///')
		popd
	elif [[  "$(pwd)" =~ .*"/marius\b".* ]]; then
		cwdir="$(pwd | sed 's/marius.*/cw/')"
		pushd "$cwdir"
		cwbranch=$(git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///')
		popd
	fi
	out=""
	branch=$(git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///')
	if [ -n "$branch" ]; then
		out+="[%F{green}'$branch'%f"
		if [ -n "$cwbranch" ]; then
			out+='    cw: %F{green}'$cwbranch'%f'
		fi
		out+="]"
	fi
	echo $out
}

function current_preset()
{
	if [[  "$(pwd)" =~ .*"/caligula".* ]]; then
		echo "[%F{yellow}$( cat builddir/current_preset 2>/dev/null )%f]"
	elif [[  "$(pwd)" =~ .*"/marius".* ]]; then
		echo "[%F{yellow}$( cat builddir/current_preset 2>/dev/null )%f]"
	fi
	echo ""
}

# git status in prompt
# Find and set branch name var if in git repository.
function git_branch_name_nocolor()
{
	cwbranch=""
	if [[  "$(pwd)" =~ .*"caligula".* ]]; then
		cwdir="$(pwd | sed 's/caligula.*/cw/')"
		pushd "$cwdir"
		cwbranch=$(git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///')
		popd
	elif [[  "$(pwd)" =~ .*"marius".* ]]; then
		cwdir="$(pwd | sed 's/marius.*/cw/')"
		pushd "$cwdir"
		cwbranch=$(git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///')
		popd
	fi
	out=""
	branch=$(git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///')
	if [ -n "$branch" ]; then
		out+="['$branch'"
		if [ -n "$cwbranch" ]; then
			out+="    cw: '$cwbranch'"
		fi
		out+="]"
	fi
	echo $out
}
# Enable substitution in the prompt.
setopt prompt_subst

PROMPT='%F{%(!.red.green)}%m%f   %3~
%(!.#.$) '

RPROMPT='$(current_preset) $(git_branch_name) [%F{yellow}%?%f]'
