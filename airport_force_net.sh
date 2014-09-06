# Configure the network, which you want stay always connected
NETWORK='paridin.local 5ghz'

#No changed this value unless you want to send the output to shell, 
# PROD TRUE is for logging the rebooting events 
PROD='TRUE'
air_status=$(/usr/sbin/networksetup -getairportpower en1 | awk '{ print $3 }' | cut -d \( -f2 | cut -d \) -f1)

if [[ $air_status = "en1" ]]; then
    anet=$(/usr/sbin/networksetup -getairportnetwork en1 | cut -d \: -f2 |  cut -c 2- ) # cleaned the first character always be " "

    if [[ $anet != $NETWORK ]]; then
        # rebooting
        if [[ $PROD == 'TRUE' ]]; then
            echo "`date +%Y-%m-%d:%H:%M:%S` - Rebooting airport it was connected at $anet" >> /tmp/reboot_no_correct_net.log
        else
            echo "`date +%Y-%m-%d:%H:%M:%S` - Rebooting airport it was connected at $anet"
        fi
        /usr/sbin/networksetup -setairportpower en1 off
        #at this point the airport is down

        /usr/sbin/networksetup -setairportpower en1 on
        #at this point the airport is up
    fi
fi
