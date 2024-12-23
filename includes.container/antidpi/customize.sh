ui_print "Current arch is $ARCH"
mkdir $MODPATH/system
mkdir $MODPATH/system/bin
ui_print "Extracting zip"
unzip -oq "$ZIPFILE" "dpi" -d "$MODPATH/system/bin"
unzip -oq "$ZIPFILE" "dpitest" -d "$MODPATH/system/bin"
unzip -oq "$ZIPFILE" "nfqws_$ARCH" -d "$MODPATH/system/bin"
mv "$MODPATH/system/bin/nfqws_$ARCH" "$MODPATH/system/bin/nfqws"

if ! [ -e "/system/etc/resolv.conf" ]; then 
mkdir $MODPATH/system/etc
unzip -oq "$ZIPFILE" "resolv.conf" -d "$MODPATH/system/etc"
fi

set_perm_recursive $MODPATH 0 2000 0775 0775
ui_print "AntiDPI module installed" 
rm -f $MODPATH/dpi >> /dev/null 
rm -f $MODPATH/dpitest >> /dev/null 
rm -f $MODPATH/resolv.conf >> /dev/null 
rm -f $MODPATH/nfqws_* >> /dev/null
rm -f $MODPATH/customize.sh >> /dev/null 