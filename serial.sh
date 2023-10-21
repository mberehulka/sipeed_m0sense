while true; do
    DPORT=$(dmesg | grep -oP "tty\K[^\]]+" | head -1)
    if [ "$DPORT" != "" ] && [ -e /dev/ttyACM$DPORT ] ; then
        break
    fi
    echo device not found, trying again...
    sleep 1
done

echo device found at ttyACM$DPORT
sudo screen /dev/ttyACM$DPORT 2000000