##airport_force_net.sh
====================

Force the airport to establish the connection with your WiFi prefered


#How install 

clon the project

```
cd /your/path/cloned
git clone https://github.com/paridin/airport_force_net.sh afn
cd afn; vi -c 2 airport_force_net.sh
```

edit into the daemon file `com.paridin.com.it.airportforcenet.plist`, the following line in `/Users/myuser/airport_force_net.sh` to the path where you located the git project `/your/path/cloned/afn`

copy the daemon file `com.paridin.com.it.airportforcenet.plist` to `/Library/LaunchDaemons`

```cp com.paridin.com.it.airportforcenet.plist /Library/LaunchDaemons```

launch the shell as daemon
```launchctl load -w /Library/LaunchDaemons/com.paridin.com.it.airportforcenet.plist```

#How uninstall

remove the daemon into launchd

````
launchctl unload -w /Library/LaunchDaemons/com.paridin.com.it.airportforcenet.plist
rm /Library/LaunchDaemons/com.paridin.com.it.airportforcenet.plist
```

remove project

```
rm /your/path/cloned/afn
```
