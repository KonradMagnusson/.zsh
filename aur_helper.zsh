PREFERRED_AUR_HELPERS=('paru' 'pakku' 'yay')
for helper in $PREFERRED_AUR_HELPERS; do
	if defined $helper; then
		export AUR_HELPER=$helper
		break
	fi
done

compdef p=$AUR_HELPER
alias p=$AUR_HELPER
