![FnKeys Logo](https://github.com/ivandfx/fnkeys/blob/main/fnkeys_logo.png?raw=true)

Fix function keys on TKL and compact keyboards under Linux. These will stop working as media control keys as expected. (that's the point)

This has been tested with Fedora 41 and Ubuntu 24.04, but it should work on everything else.

**If your distro doesn't use systemd, FnKeys may not work at all.**

## Installation
1. [Download FnKeys v1](https://github.com/ivandfx/fnkeys/releases/download/v1/FnKeysFix.sh)

2. After downloading, go to the folder where FnKeys is located and open a terminal window.

3. Then, copy & paste this:

```
sudo chmod +x FnKeysFix.sh && ./FnKeysFix.sh
```

Installation will begin, then, reboot and you're done!

FnKeys is a pretty simple script, but for some people it can be a life saver to easily fix the function keys :)

Fact: THere was a harder/more convoluted way to install FnKeys, from when it was still for my personal use, which was a more manual process, however, it is not worth including it since FnKeys works way better.

Also, if you review the code, you can get an idea of ​​how the original version used to work.
