DIR="${0%/*}"
required_files="
module.prop
uninstall.sh
system/bin/wadbd
webroot/index.html
webroot/assets/github.png
webroot/assets/index.min.css
webroot/assets/index.min.js
webroot/assets/telegram.png
"
for file in $required_files; do
    if [ ! -f "$DIR/$file" ]; then
        [ -f "$DIR/module.prop" ] && sed -i 's/^description=.*/description=Module is corrupted, please reinstall/' "$DIR/module.prop"
        touch "$DIR/disable"
        exit 1
    fi
done
