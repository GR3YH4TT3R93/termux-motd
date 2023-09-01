# Message of the Day

Collection of 'Message of the Day' scripts for [Termux](https://termux.com/).

![Screen1](Screenhots/android-logo-small.jpg)

<details><summary>More Screenshots</summary>
<img src="Screenhots/android-logo.jpg"/>
<img src="Screenhots/termux-banner.jpg"/>
</details>

### Requirements

* figlet (termux-banner)


<!-- ## Install
    wget -qO- https://git.io/Jm5hb | bash
-->

**Manually**

    rm -rf /data/data/com.termux/files/usr/etc/motd
    git clone https://github.com/GR3YH4TT3R93/termux-motd.git /data/data/com.termux/files/usr/etc/motd
    echo "/data/data/com.termux/files/usr/etc/motd/init.sh" >> /data/data/com.termux/files/usr/etc/profile # or .zprofile if using zsh

## Configure

**Disable Module:** Disable modules adding ``.disabled`` to the end of file. (e.g. ``10-android-logo-small.disabled``)
**Enable Module:** Remove ``.disabled`` from filename to enable module.

## Credits

* [yboetz/motd](https://github.com/yboetz/motd) (Orignal work)
* [generator/termux-motd](https://github.com/Generator) (Contributor)
