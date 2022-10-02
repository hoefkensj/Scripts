#!/usr/bin/env bash

function wheader {
	THISCONF=$1
	THISfCONF=$2
	HASHBANG='#!/usr/bin/env bash'
	HEAD[0]='# ############################################################################'
	HEAD[1]='# # PATH: /opt/local/scripts/rc/bash/'
	HEAD[2]="# # FILE: ${THISCONF}"
	HEAD[3]='# ############################################################################'
	HEAD[4]='#'
	echo $HASHBANG > $THISfCONF
	for LINE in "${HEAD[@]}"; do
	  echo $LINE >> $THISfCONF
	done

}

mkdir testing
mkdir -p ".backup/$(date -u +'%Y%m%d')"
for CONF in $(ls /opt/local/scripts/rc/bash/[0-9]??_*.conf) ; do	
	cp $CONF ".backup/$(date -u +'%Y%m%d')/" 
		
	CFG="$(basename $CONF)"
	BAK="./testing/tmp_$CFG"
	xCFG="./testing/${CFG}"
	cat $CONF > ./tmp
	echo $CFG
	echo $BAK
	echo $xCFG
	echo -----------
	wheader $CFG $CONF
	echo '' >> $CONF
	cat ./tmp >> $CONF	
done


