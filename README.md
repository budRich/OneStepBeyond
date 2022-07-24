This is a **fork** of  the GTK theme **OneStepBack**, 
originally by [Jean-Pierre Bucciol].  

I have made a complete rewrite of the gtk-3.0 theme
in sass. But have not touched the gtk-2.0 or gtk-4.0 files.

### build dependencies:
GNU make , sassc

### dev dependencies:
there are some convenience targets in the makefile
that automatically reloads the theme and stuff, for
that to work you need `xfconfd` running (Xfce4)  


```shell
make PREFIX=~/.local install
# install theme at ~/.local/share/themes/OneStepBeyond
sudo make PREFIX=/usr install
# install theme at /usr/share/themes/OneStepBeyond
make install
# install theme at ~/.themes/OneStepBeyond
make install-dev
# symlink theme/ to ~/.themes/OneStepBeyond
make watch
# auto reload theme (must be symlinked) when files
# in src/sass is modified.
make restore
# use original OneStepBack GTK3 theme , autoreload
# (must be symlinked)
```

[Jean-Pierre Bucciol]: http://www.vide.memoire.free.fr/perso/OneStepBack/onestepback.php

