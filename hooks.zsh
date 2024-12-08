autoload -Uz add-zsh-hook
#
# Rehash on Install/Upgrade/Remove
{
    zshcache_time="$(date +%s%N)"

    rehash_precmd() {
      if [[ -a /var/cache/zsh/pacman ]]; then
        local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
        if (( zshcache_time < paccache_time )); then
          rehash
          zshcache_time="$paccache_time"
        fi
      fi
    }

    add-zsh-hook -Uz precmd rehash_precmd
}

# set terminal title
{
# set zsh as title when a terminal opens
    function precmd() {
        echo -ne "\033]0;zsh\007"
    }

    # set $1 as the terminal title
    function preexec() {
        echo -ne "\033]0;$1\007"
    }
}
