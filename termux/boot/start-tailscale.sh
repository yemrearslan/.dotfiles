#!/data/data/com.termux/files/usr/bin/sh

adb shell am force-stop com.tailscale.ipn
sleep 1
adb shell am start -n com.tailscale.ipn/.MainActivity
sleep 2
adb shell am broadcast -a com.tailscale.ipn.CONNECT_VPN -n com.tailscale.ipn/.IPNReceiver --ez "connect" true
sleep 2


# ESKİ HALİ
#adb shell input keyevent KEYCODE_HOME 
#am start -n com.tailscale.ipn/.MainActivity -a android.intent.action.VIEW
#sleep 2
#am broadcast -a com.tailscale.ipn.CONNECT_VPN -n com.tailscale.ipn/.IPNReceiver --ez "connect" true
#sleep 2
#am start -a android.intent.action.MAIN -c android.intent.category.HOME

