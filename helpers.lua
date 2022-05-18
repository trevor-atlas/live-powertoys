

function isHolding(key)
    return hs.eventtap.checkKeyboardModifiers()[key] == true
end

function isEmpty(str)
    return str == nil or str == ''
end

function dump(o)
    if type(o) == 'table' then
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. k..': ' .. dump(v) .. ',\n  '
        end
        return s .. '\n}'
    else
        return tostring(o)
    end
end


function loadMenuItem(name)
    return function() print('clicked '..name)
    end
end

function getLive()
    return hs.application.find("Live")
end

function getLiveMenus()
    return getLive():getMenuItems()
end

function isLiveFocused()
    local liveWindow = hs.application.find("Live"):name()
    local focusedWindow = hs.window.focusedWindow():application():name()
    return liveWindow == focusedWindow
end