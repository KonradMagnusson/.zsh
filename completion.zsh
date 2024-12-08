zmodload zsh/complist
autoload -Uz colors && colors

# zsh facilitates shooting of one's feet:
# > Any of the strings "true", "on", "yes", and "1" can be used for the value "true" and any of the strings "false", "off", "no", and "0" for the value "false".
# So the only sane course of action is then of course to use "on" and "no".

# pro memoria
# :completion:function:completer:command:argument:tag

zstyle ':completion:*' completions on
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _correct _history _approximate
zstyle ':completion:*' format "$fg[cyan]Completing $fg_bold[green]<%d>$reset_color"
zstyle ':completion:*' auto-description "$fg[cyan]specify: $fg_bold[green]<%d>$reset_color"
zstyle ':completion:*' glob on

source ~/.zsh/zls_colors.zsh
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors $ZLS_COLORS
zstyle ':completion:*' list-prompt "%S%P (%L) %s"

zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' original on
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute on
zstyle ':completion:*' verbose on
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"

bindkey -M menuselect 'j' vi-backward-char
bindkey -M menuselect 'k' vi-down-line-or-history
bindkey -M menuselect 'l' vi-up-line-or-history
bindkey -M menuselect 'ö' vi-forward-char

autoload -Uz compinit && compinit
