#!/usr/bin/env bash
if [[ $1 == "-a" ]]; then
	ALL=$(eix -"#c" $2)
	for item in  $ALL; do
		echo $item
	done
else
	FOUND=$(eix -"Ry#c" $1|grep -iE ".*?/$1\$")
	if (( $(grep -c . <<<"$FOUND") == 1 )); then 
		echo $FOUND
	else
		exit
	fi		
fi
