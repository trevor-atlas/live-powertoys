configPath = '~/.config/live-powertoys/'
configName = 'settings.json'

defaultSettings = {
        -- automatically add plugins after looking them up
        autoadd = true,
        
        -- amount of seconds it takes for LES to attempt to add the item after looking it up.
        -- increase this value if you have a slow hard disk, which could cause LES to try to add items before they’ve been found.
        loadspeed = 0.3,
        
        -- optional feature where LES will click a certain point on your screen after using the menu. This can be used to click a collection, or close a browser. 
        -- Due to limitations in macOS, this feature is only enabled on fullscreen mode for the time being.
        resettobrowserbookmark = 0,
        
        -- the X and Y coordinates in pixels on the screen, on which to click
        -- the default values are just some random spot
        -- use the screenshot tool to find the coords you want.
        bookmarkx = 500,
        bookmarky = 500,
        
        -- this prevents the loop button from being enabled by default in midi clips created with the Cmd + Shift + M shortcut. 
        disableloop = true,
        
        -- toggles the cmd + alt + s shortcut that duplicates and saves your project as a new version similar to FL Studio.
        -- the syntax is in this format [project name]_[version].
        saveasnewver = true,
        
        -- switches the marker shortcut from Shift + L to Alt + L. 
        -- it is recommended to keep this on in the mac version if you like capitalising letters.
        altgrmarker = true,
        
        -- toggles the double 0 to delete shortcut
        double0todelete = true,
        
        -- toggles the shortcuts ctrl + alt + d and ctrl + alt + v.
        -- it's best to disable this feature if you want to use video in your project files since ctrl + alt + v is actually a taken shortcut in this scenario.
        absolutereplace = true,
        
        -- maps the absolute duplicate shortcut to cmd + ctrl + D if you don’t want to disable or overwrite the default dock hide/unhide shortcut on prefences > keyboard > shortcuts.
        ctrlabsoluteduplicate = false,
        
        -- toggles the Ctrl + W and Ctrl + Shift + W shortcuts.
        enableclosewindow = true,
        
        -- toggles the suite of VST specific shortcuts.
        vstshortcuts = true,
        
        -- the key that is used as the piano roll macro.
        -- So if you want to remap it to the 1 key, just type “1”.
        pianorollmacro = '~',
        
        -- replaces the menubar icon graphic in the top right with text saying “LES”
        texticon = false,

        quickAddMenu = {
            Plugins = {
                [1] = {
                    title = 'Serum',
                    pluginName = 'Serum vst'
                },
                [2] = {
                    title = 'Pigments',
                    pluginName = 'Pigments'
                }
            },
            Effects = {
                [1] = {
                    title = 'Reverb',
                    pluginName = 'Reverb',
                },
                [2] = {
                    title = 'EQ Eight',
                    pluginName = 'EQ Eight',
                }
            },
            Processing = {
                title = 'EQ Eight',
                pluginName = 'EQ Eight',
            },
        }
    }

defaultMappings = {
    openQuickMenu = {{"cmd", "shift"}, "B"},
    closePluginWindow = {{"cmd"}, "w"},
    closeAllWindows = {{"cmd", "shift"}, "W"},
    createMarker = {{"shift"}, "L"}
}
