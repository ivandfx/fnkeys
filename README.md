![FnKeys Logo](https://github.com/ivandfx/fnkeys/blob/main/fnkeys_logo.png?raw=true)

Fix function keys on Linux for almost every TKL and % keyboards. These will stop working as media control keys as expected. (that's the point)

This has been tested with Fedora 41 and Ubuntu 24.04, but it should work on everything else.

**If your distro doesn't use systemd, FnKeys may not work at all.**

## Online installation
This is what most users will need:
```
curl -O https://raw.githubusercontent.com/ivandfx/fnkeys/refs/heads/main/FnKeysFix.sh
```

## Offline installation
[Download FnKeys v1](https://github.com/ivandfx/fnkeys/releases/download/v1/FnKeysFix.sh)

After downloading, go to the folder where FnKeys is and open a terminal window.

Then, make sure FnKeys has execution permissions using
```
chmod +x FnKeysFix.sh 
```
Finally, run FnKeys with
```
./FnKeysFix.sh
```

And you're done!


Alternatively, there is a harder/more convoluted way to install FnKeys, from when it was still for my personal use, which was a more manual process, however, it is not worth including it since FnKeys works better.

Also, if you review the code, you can get an idea of ​​how the original version used to work.
