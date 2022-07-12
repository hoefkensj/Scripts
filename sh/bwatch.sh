#!/usr/bin/env sh
READFROM=$1
MATCH=$2
COLOR=$[ 29 + 0$3 ]
printf "\nPress \033[1;32m[ctrl]+[c]\033[0m to quit.\n\n"
function help() {
	echo 'USE: $ bwatch [PATH] [STR] [INT]'
	echo 'PATH	:	file to watch'
	echo 'STR		:	string to watch for'
	echo 'INT		:	{0..16} Color (ANSI 29+)'
	echo '			:	eg: 2 = RED 3 = GREEN ,... '
	echo 'TIP: use in Terminal with miniview/minimap to quickly spot highlighted content;eg http://terminolo.gy'
	exit
}
[[ $1 == -h ]] && help

tail -n 5 -f $READFROM | bat --style grid,numbers -f --pager "sed 's/$MATCH/\o033[1;${COLOR}m&\o033[0m/g'"
