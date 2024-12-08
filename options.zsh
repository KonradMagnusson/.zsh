umask 002

bindkey "^R" history-incremental-search-backward

HISTFILE=~/.zhistory
HISTSIZE=10000000
SAVEHIST=10000000
REPORTTIME=1

setopt append_history
setopt autocd
setopt autopushd
setopt extended_history
setopt extendedglob
setopt hash_list_all
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt histverify
setopt long_list_jobs
setopt longlistjobs
setopt noglobdots
setopt nohup
setopt notify
setopt pushdsilent
setopt share_history
