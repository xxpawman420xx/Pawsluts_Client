## This is my take on the walltaker client for Linux, tested on Ubuntu 24.04 and only supports the gnome desktop this client sets your desktop background (no matter if your using default or dark theme) to the current selected picture on your walltaker link, and you have the option of downloading a copy of each wallpaper change to your computer wallpapers are stored in the wallpapers folder which is created for you if you enable the download option (by default its set to on) whatever folder you choose to run the client in, is also the same directory where the wallpaper folder is made

**To use my client, first open pawslut_wt.sh in your favorite test editor and change id to your own link id, then choose if you want to have wallpapers downloaded or not (1 = on and 0 = off) after that set the file to be executable and finally set it as a startup program so it runs automatically (you can use the built in startup programs menu in Ubuntu or use crontab -e to set it as a cron job**

**REQUIREMENTS:**
 1. gnome desktop (it comes with ubuntu and thats what i used to build
    my client but if your on another distro then consult google to
    install gnome) (I personally use x11 (XORG) and thats what i used
    when testing my client, it may work on wayland as well but i cannot
    test this
 2. sed (sudo apt install sed if your missing it)

 3. curl (and an internet connection) (sudo apt install curl if your missing it)

 4. optional: Ubuntu 24.04 desktop with gnome
