# Primus

This is a simple Wayland compositor based on wlroots, using tinywl and dwl as reference/starting point. It aims to implement a Wayland compositor in the fewest lines of code possible, while still having all the features I'm looking for on a compositor.

## Building Primus

Simply install the dependencies:

- wlroots-0.20
- wayland-protocols
- kitty _(optional, unless you don't modify the config.h definition for terminal)_

And run `make`.

## Running Primus

You can run Primus with `./primus`. In an existing Wayland or X11 session,
Primus will open a Wayland or X11 window respectively to act as a virtual
display. You can then open Wayland windows by setting `WAYLAND_DISPLAY` to the
value shown in the logs. You can also run `./primus` from a TTY.

You can use `-s [cmd]` to run a command at startup.
Primus supports the following keybindings out-of-the-box:

- `Super+Shift+Q`: Terminate the compositor
- `Super+Return`: Start kitty terminal emulator

`Super` is the Windows key. This can be configured in `config.h` by setting the `MODKEY` define.

## Limitations

Notable omissions from Primus:

- HiDPI support
- Any kind of configuration, e.g. output layout
- Any protocol other than xdg-shell (e.g. layer-shell, for
  panels/taskbars/etc; or Xwayland, for proxied X11 windows)
- Optional protocols, e.g. screen capture, primary selection, virtual
  keyboard, etc. Most of these are plug-and-play with wlroots, but they're
  omitted for brevity.
