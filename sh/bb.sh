#!/usr/bin/env bash

function bytepwr() {
	case "$POW" in
	    K )
		BYTES=$(echo $VAL   *   1024                        |bc )
	    ;;
	    M )
		BYTES=$(echo $VAL   *   1048576                     |bc )
	    ;;
	    G )
		BYTES=$(echo $VAL   *   1073741824                  |bc )
	    ;;    
	    T )
		BYTES=$(echo $VAL   *   1099511627776               |bc )
	    ;;
	    P )
		BYTES=$(echo $VAL   *   1125899906842624            |bc )
	    ;;
	    E )
		BYTES=$(echo $VAL   *   1152921504606846976         |bc )
	    ;;
	    Z )
		BYTES=$(echo $VAL   *   1180591620717411303424      |bc )
	    ;;
	    0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9  )
		BYTES=$3
	;;
	esac

}


NA='N/A'
IF=$1
OF=$2
[[ -n $(lsblk -bno SIZE $IF 2>/dev/null) ]] && ISIZE="$(lsblk -bno SIZE $1)"
[[ -z $(lsblk -bno SIZE $IF 2>/dev/null) ]] && [[ -e $IF ]] && [[ -s $IF ]] && ISIZE=$(du -b $IF)
[[ -n $(lsblk -bno SIZE $OF 2>/dev/null) ]] && OSIZE= $(lsblk -bno SIZE $1)

[[ -z $3 ]] && POW=${3:(-1)} 
[[ -z $3 ]] && VAL=${3::-1}

[[ -z $(lsblk -bno SIZE $OF 2>/dev/null) ]] && [[ ! -e $IF ]] && OSIZE=$BYTES


printf "SOURCE-SIZE:\t\x1b[32m$ISIZE\t\x1b[0m"

