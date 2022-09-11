#!/usr/bin/env bash
for conf in $(ls /opt/local/scripts/rc/bash/[3-9]??_*) ; do	

	HEADER0='#!/usr/bin/env bash'
	HEADER1='#'
	HEADER2="# FILE: ${conf} PART OF bashrc.conf"
	HEADER3='########'
	HEADER4='#'
	INCLUD1="cat ${0##*/} >> bashrc.conf "
	INCLUD2='#'

	FOOTER0='#'
	FOOTER1="# END FILE : ${conf}"
	FOOTER2='################################################################################'
	xCFG="$(basename x$conf)"


	touch tmp
	cat $xCFG > tmp
	echo $HEADER0 > $xCFG
	echo $HEADER1 >> $xCFG
	echo $HEADER2 >> $xCFG
	echo $HEADER3 >> $xCFG
	echo $HEADER4 >> $xCFG
	cat ./tmp >> $xCFG
	echo $FOOTER0 >> $xCFG
	echo $FOOTER1 >> $xCFG
	echo $FOOTER2 >> $xCFG
	# rm tmp
done


