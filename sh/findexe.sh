#!/usr/bin/env bash



function wrapitems()
	{
		ARGS=$(echo "$@" | xargs printf -- '.*?%s') 
		FOUND=$(compgen -A function -bcak | grep -Ei "$ARGS.*?\$")
		echo $FOUND

	}
function itemforline()
	{
     		ARGS=$(echo "$@" | xargs printf -- '.*?%s') 
     		FOUND=$(compgen -A function -bcak | grep -Ei "$ARGS.*?\$"|xargs -n1 echo )
		printf "$FOUND"
     		 
 	}

case $1 in 
	'-#' )
		shift 1
		itemforline $@
	;;
	* )
		wrapitems $@ 
	;;
esac


