!/usr/bin/env bash
NTFS_DRIVES=$(lsblk --list -o FSTYPE,PATH | awk '$1 == "ntfs" {print $2}') 
echo $NTFS_DRIVES | xargs -n1 ntfsfix
echo $NTFS_DRIVES | xargs -n1 ntfsfix -d
echo done
