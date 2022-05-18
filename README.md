## Live Powertoys

this is a script for [Hammerspoon](https://www.hammerspoon.org/)
installation is simple:
- place these files in a folder at ~/.hammerspoon/LivePowertoys.spoon
- load it from ~/.hammerspoon/init.lua
    ```lua
    hs.loadSpoon('LivePowertoys')
    ```

shortcuts added so far:
 - `cmd+shift+B` openQuickMenu
    Opens a configurable quick access menu to add various VSTs/plugins. configurable by editing `~/.config/live-powertoys/settings.json`
    Each entry under quickAddMenu will create a new top level menu item.
    for the default config you get

    ```
    Plugins
        Serum
        Pigments
    Effects
        Reverb
        EQ Eight
    Processing
        EQ Eight
    ```
    `title` is what you will see in the menu.
    `pluginName` is what will be searched for in the Live browser to find/add that plugin/effect. make it as specific as you can.
- `cmd+w` close the active plugin window
- `cmd+shift+w` close all plugin windows
- `shift+L` create a marker, the same as clicking `create -> Add Locator`