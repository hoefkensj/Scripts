(pv -n $1 | dd of=$2  bs=16M conv=notrunc,noerror) 2>&1 | dialog --gauge "Cloning $1 to $2 ..." 10 70 0
