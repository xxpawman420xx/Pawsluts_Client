#!/bin/sh
#-------------------------------------------------
#CHANGE id to your own walltaker link id - make your own link id here: https://walltaker.joi.how/
id=19110
#download means if you want to download a copy of each wallpaper change, value can be 1 for on or 0 for off (default is on)
download=1
#-------------------------------------------------
#*** DANGER ZONE - DO NOT CHANGE ANYTHING BELOW HERE ***
old_path="$PWD"
cd "$(dirname $(realpath "$0"))"

desktop=GNOME
case "$desktop" in
    "GNOME")
        set_wallpaper() {
            gsettings set org.gnome.desktop.background picture-uri-dark file:///"$1"
            gsettings set org.gnome.desktop.background picture-uri file:///"$1"
        }
        ;;
esac

grab() {
    response=$(curl -s "https://walltaker.joi.how/api/links/"$id".json" -0 --header "User-Agent: PawSlut")
    url=$(echo $response | grep -oE '"post_url":".*"' | sed -e 's/"post_url":"//' -e 's/".*//')

    if [ "$url" != "$cache" ]; then
        cache=$url
        if [ $download = 0 ]; then rm wallpapers/*; fi
        filename=$(echo $url | sed -e 's/.*\///g')
        curl -O "$url"
        mkdir wallpapers > /dev/null 2>&1
        mv -f $filename wallpapers/$filename
        
        set_wallpaper $(realpath "wallpapers/$filename")
    fi
}

while true
do
    grab
    sleep 15
done
cd "$old_path"

