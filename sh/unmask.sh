#!/usr/bin/env bash
ATM=$1
PKG="$(basename $ATM)"
CAT="$(dirname $ATM)"
REP=$2
FUNMASK="/etc/portage/package.unmask/${PKG}"
[[! -f "${FUNMASK}"]] && touch $FUNMASK

echo "${CAT}/${PKG}::${REP}" >> $FUNMASK
bat $FUNMASK
