export NINJA_STATUS="%{bold fg8 bg235}[ %{fg40}%p%{fg8 bg235} | %{fg6 italic}%f/%t%{fg8 bg235 noitalic} | %{fg11}%es%{fg8 bg235} ]%{reset}"
export NINJA_ENABLE_QNRDS_HACKS=1
export PATH="/home/qnrd/.zsh/bin:/home/qnrd/bin:/home/qnrd/bin/oostools/:/home/qnrd/bin/tracytools/:$PATH"
#export SDL_VIDEODRIVER=wayland
export SYSTEMD_EDITOR=nvim
export KEYTIMEOUT=1 # Kill the Esc delay...
export EDITOR='nvim'
export VISUAL='nvim'
export CLICOLOR_FORCE=1

source ~/.timefmt
source ~/.EZA_COLORS

if [ -f ~/.local/env ]; then
	source ~/.local/env
fi
