# FnKeys

Fix function keys on TKL and compact keyboards under Linux. These will stop working as media control keys as expected. (that's the point)

Tested on:
DISTROS
- Fedora 38/39/40/41/42*
- Debian 11, 12, 13RC1
- Ubuntu 22.04/24.04
- Linux Mint 22/22.1
- OpenSUSE Tumbleweed
- Arch Linux

KEYBOARDS
- Newskill Serike V2 TKL

*Fedora 42 requires FnKeys V2.

**If your distro doesn't use systemd, FnKeys may not work at all.**

## Installation
1. [Download FnKeys](https://github.com/ivandfx/fnkeys/releases)

2. After downloading, go to the folder where FnKeys is located and open a terminal window.

3. Then, copy & paste this:

```
sudo chmod +x FnKeysFix.sh && ./FnKeysFix.sh
```

And you're done!

FnKeys is a pretty simple script, but for some people it can be a life saver to easily fix the function keys :)
