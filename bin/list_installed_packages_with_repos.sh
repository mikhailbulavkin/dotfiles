pacman -Sl | awk '/installed.$/{print $1 "/" $2;}' && pacman -Qm | awk '{print "other/" $1}'
