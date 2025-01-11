ui_print "[*] Checking installation environment..."
if [ "$APATCH" ]; then
    ui_print " => APatch: $APATCH_VER │ $APATCH_VER_CODE"
    ap_dir="/data/adb/ap/bin"
    if [ -d "$ap_dir" ]; then
        ln -sf "$MODPATH/system/bin/wadbd" "$ap_dir/wadbd"
        ui_print " => Created symlink"
    else
        ui_print " => APatch directory not found. Skipping symlink."
    fi
    rm -f "$MODPATH/action.sh"
elif [ "$KSU" ]; then
    ui_print " => KSU: $KSU_KERNEL_VER_CODE │ $KSU_VER_CODE"
    ks_dir="/data/adb/ksu/bin"
    if [ -d "$ks_dir" ]; then
        ln -sf "$MODPATH/system/bin/wadbd" "$ks_dir/wadbd"
        ui_print " => Created symlink"
    else
        ui_print " => KernelSU directory not found. Skipping symlink."
    fi
    rm -f "$MODPATH/action.sh"
elif [ "$MAGISK_VER_CODE" ]; then
    ui_print " => Magisk: $MAGISK_VER │ $MAGISK_VER_CODE"
else
    ui_print "! Recovery is not supported."
    abort ""
fi
ui_print "[*] Checking USB debugging status..."
if getprop persist.sys.usb.config | grep -q "adb"; then
    ui_print " => USB debugging is enabled."
else
    ui_print " => USB debugging is NOT enabled."
    ui_print " => Warning: USB debugging needs to be enabled for the module to work properly."
fi

ui_print ""
ui_print " => 🔍 Gathering device information..."
sleep 1
ui_print "📱 => Manufacturer: $(getprop ro.product.manufacturer)"
ui_print "📱 => Model: $(getprop ro.product.model)"
ui_print "📱 => Android Version: $(getprop ro.build.version.release)"
ui_print "📱 => Security Patch: $(getprop ro.build.version.security_patch)"
ui_print "🔧 => Build Fingerprint: $(getprop ro.build.fingerprint)"
sleep 1

set_perm_recursive "$MODPATH/system" 0 0 0755 0755
ui_print "=> Installation Completed!"
