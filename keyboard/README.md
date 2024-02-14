
# Keyboard layout

This folder contains a custom keyboard layout based on the Swiss-German layout (no dead keys).

The contents in `evdev.xml` go into `/usr/share/X11/xkb/rules/evdev.xml` into the `<layoutList>` tag.

The other file (`tosch`) can be copied as is into `/usr/share/X11/xkb/symbols/`.

This has been tested on Fedora 39 with GNOME 45.3 on Wayland.
