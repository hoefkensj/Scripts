#!/usr/bin/env bash

function wheader {
	HEADER0='#!/usr/bin/env bash'
	HEADER1='#'
	HEADER2="# FILE: ${conf}"
	HEADER3='########'
	HEADER4='#'
	echo $HEADER0 > $xCFG
	echo $HEADER1 >> $xCFG
	echo $HEADER2 >> $xCFG
	echo $HEADER3 >> $xCFG
	echo $HEADER4 >> $xCFG
}
function wfooter {
	FOOTER0='#'
	FOOTER1="# END FILE : ${conf}"
	FOOTER2='################################################################################'
	echo $FOOTER0 >> $xCFG
	echo $FOOTER1 >> $xCFG
	echo $FOOTER2 >> $xCFG
}
mkdir testing
for conf in $(ls /opt/local/scripts/rc/bash/[3-9]??_*) ; do	
	
	touch testing/tmp
	CFG="$(basename $conf)"
	BAK="./testing/tmp_$CFG"
	xCFG="./testing/${CFG}"
	cat $CFG > $BAK
	wheader 
	cat $BAK >> $xCFG
	wfooter
	# rm tmp
done


