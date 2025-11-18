#!/data/data/com.termux/files/usr/bin/sh
am start -n com.tailscale.ipn/.MainActivity -a android.intent.action.VIEW
sleep 2
am broadcast -a com.tailscale.ipn.CONNECT_VPN -n com.tailscale.ipn/.IPNReceiver --ez "connect" true
sleep 2
am start -a android.intent.action.MAIN -c android.intent.category.HOME
