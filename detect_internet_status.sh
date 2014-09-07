PKG_LOSE=$(ping -c 1 google.com | grep packet | awk '{ print $7  }'  )
PKG_LOSE_LENGTH=$(echo $PKG_LOSE | wc -m)

# the variable if empty
# ping: cannot resolve status: Unknown host

air_status=$(/usr/sbin/networksetup -getairportpower en1 | awk '{ print $3 }' | cut -d \( -f2 | cut -d \) -f1)
if [[ $air_status = "en1" ]]; then
    if [[ $PKG_LOSE == '100.0%' || `echo $PKG_LOSE | wc -m` -eq 1 ]]; then
        #reboot airport
        /usr/sbin/networksetup -setairportpower en1 off
        #at this point the airport is down

        /usr/sbin/networksetup -setairportpower en1 on
        #at this point the airport is up
    fi
fi
