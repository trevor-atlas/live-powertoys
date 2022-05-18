function import(filename)
    dofile(hs.spoons.resourcePath(filename))
end

import('helpers.lua')
import('constants.lua')


local LivePowertoys = {
    name = 'Live Powertoys',
    version = '1',
    author = 'Trevor Atlas hello@trevoratlas.com',
    license = 'The MIT License (MIT)',
    homepage = '',
    settings = {},
    quickMenu = nil,
    mappings = {}
}

function LivePowertoys:initConfig()
    hs.fs.mkdir(configPath)
    hs.fs.touch(configPath .. configName)
    hs.json.write(defaultSettings, configPath .. configName, true)
end

function LivePowertoys:init()
    -- load config
    if hs.fs.attributes(configPath .. configName) == nil then
        self:initConfig(self)
    end
    self.settings = hs.json.read(configPath .. configName)
    print(dump(self.settings))
    self:buildQuickMenu()
    self:bindHotkeys()
    print('Live Powertoys initialized')

end

function LivePowertoys:start()
    for _, hotkey in ipairs(self.mappings) do
    hotkey:enable()
    end
end

function LivePowertoys:stop()
    for _, hotkey in ipairs(self.mappings) do
    hotkey:disable()
    end
end

  function LivePowertoys:map(mods, key, message, fn)
    return hs.hotkey.bind(mods, key, message, fn, nil, nil)
  end

function LivePowertoys:bindHotkeys(mapping)

    if mapping == nil then
        mapping = defaultMappings
    end
    if not next(self.mappings) == nil then
       self:stop()
        for _, hotkey in ipairs(self.mappings) do
            hotkey:delete()
        end
        self.mappings = {}
    end

    for k, v in pairs(mapping) do
        local fn = hs.fnutils.partial(self[k], self)
        local hotkey = hs.hotkey.bind(v[1], v[2], v[3], fn, nil, nil)
        hotkey:disable()
        table.insert(self.mappings, hotkey)
    end

    if isLiveFocused() then
        self:start()
    end
  
    local appFilter = hs.window.filter
    appFilter.new(function(window)
        return string.match(window:application():name(), "Live")
    end)
        :subscribe(appFilter.windowFocused, hs.fnutils.partial(self.start, self))
        :subscribe(appFilter.windowUnfocused, hs.fnutils.partial(self.stop, self))
end

function LivePowertoys:parseMenuConfig()
    local config = self.settings.quickAddMenu
    local menu = {}
    local index = 1

    for key, value in pairs(config) do
        table.insert(menu, index, {
            title = key,
            menu = {}
        })

        for idx, v in ipairs(value) do
            table.insert(menu[index].menu, idx, {
                title = v['title'],
                fn = loadMenuItem(v['pluginName'])
            })
        end
        index = index + 1
    end
    print(dump(menu))
    return menu
end

function LivePowertoys:buildQuickMenu()
    self.quickMenu = hs.menubar.new(true)
    local menuContent = self:parseMenuConfig()

    self.quickMenu:setMenu(menuContent)
    self.quickMenu:setTitle("Live Powertools")
    
end

--- LivePowertoys:openQuickMenu()
--- Method
--- opens the quick menu to quickly add instruments or effects
function LivePowertoys:openQuickMenu()
    print('openQuickMenu')
    self.quickMenu:popupMenu(hs.mouse.getAbsolutePosition())
end

function LivePowertoys:closePluginWindow()
    print('closePluginWindow')
    local mainwindowname = nil
    mainwindowname = hs.application.find("Live"):mainWindow()
    focusedWindow = hs.window.frontmostWindow()
    if mainwindowname ~= focusedWindow then
        focusedWindow:close()
    end
end

function LivePowertoys:closeAllWindows()
    print('closeAllWindows')
    local allwindows = hs.application.find("Live"):allWindows()
    local mainwindowname = nil
    mainwindowname = hs.application.find("Live"):mainWindow()
    for i = 1, #allwindows, 1 do
        if allwindows[i] ~= mainwindowname then
            allwindows[i]:close()
        end
    end
end

function LivePowertoys:createMarker()
    print('createMarker')
    local app = getLive()
    local menuItems = getLiveMenus()
    if string.match(app:path(), "Live 9") then
        app:selectMenuItem(menuItems[4].AXChildren[1][13].AXTitle)
    elseif string.match(app:path(), "Live 10") then
        app:selectMenuItem(menuItems[4].AXChildren[1][14].AXTitle)
    else
        -- menuItems[4] is 'create'
        -- print(dump(menuItems[4].AXChildren[1][20]))
        app:selectMenuItem(menuItems[4].AXChildren[1][20].AXTitle)
    end
    hs.eventtap.keyStroke({}, "delete", 0)
end

return LivePowertoys