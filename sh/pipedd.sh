#!/usr/bin/env bash
SIZE1=$(lsblk -bdno SIZE $1 2>/dev/null)
SIZE2=$(lsblk -bdno SIZE $2 2>/dev/null)
[[ -z "$SIZE1"  ]]  && SIZE="$SIZE2"
[[ -n "$SIZE1"  ]]  && SIZE="$SIZE1"
pv -per -s $SIZE $1 | dd of=$2 bs=16M conv=notrunc,noerror
