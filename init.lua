-- Window movement

local mash = {'cmd', 'alt'}
local mashrow = {'cmd', 'alt', 'ctrl'}
local mashshift = {'cmd', 'alt', 'shift'}
local mashall = {'cmd', 'alt', 'ctrl', 'shift'}

-- Left = 0; width = 1/2 vw
hs.hotkey.bind(mashrow, 'Left', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.w = max.w / 2
	win:setFrame(f)
end)

-- Left = 1/2 vw; width = 1/2 vw
hs.hotkey.bind(mashrow, 'Right', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.w = max.w / 2
	win:setFrame(f)
end)

-- Top = 0; height = 1/2 vh
hs.hotkey.bind(mashrow, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Top = 1/2 vw; height = 1/2 vh;
hs.hotkey.bind(mashrow, 'Down', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y + (max.h / 2)
	f.h = max.h /2
	win:setFrame(f)
end)

-- Translate
-- Top -= 1/8 vh
hs.hotkey.bind(mashshift, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.y = f.y - dh
	f.h = f.h + dh
	win:setFrame(f)
end)

-- Top += 1/8 vh
hs.hotkey.bind(mashshift, 'Down', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.y = f.y + dh
	f.h = f.h - dh
	win:setFrame(f)
end)

-- Bottom -= 1/8 vh
hs.hotkey.bind(mash, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.h = f.h - dh	
	win:setFrame(f)
end)

-- Bottom += 1/8 vh
hs.hotkey.bind(mash, 'Down', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.h = f.h + dh
	win:setFrame(f)
end)

-- Right -= 1/8 vw
hs.hotkey.bind(mash, 'Left', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.w = f.w - dw
	win:setFrame(f)
end)

-- Right += 1/8 vw
hs.hotkey.bind(mash, 'Right', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.w = f.w + dw
	win:setFrame(f)
end)

-- Left -= 1/8 vw
hs.hotkey.bind(mashshift, 'Left', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.x = f.x - dw
	f.w = f.w + dw	
	win:setFrame(f)
end)

-- Left += 1/8 vw
hs.hotkey.bind(mashshift, 'Right', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.x = f.x + dw
	f.w = f.w - dw
	win:setFrame(f)
end)

-- Full screen
hs.hotkey.bind(mashall, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	win:setFrame(f)
end)

local homeSSID = "our house" -- home WiFi SSID

function onHomeWifi()
	currentSSID = hs.wifi.currentNetwork()
	return currentSSID == homeSSID
end

local lastNumberOfScreens = #hs.screen.allScreens()

function screenWatchCallback()
	newNumberOfScreens = #hs.screen.allScreens()

	if lastNumberOfScreens ~= newNumberOfScreens and newNumberOfScreens == 2 and onHomeWifi() == true then
		hs.alert.show('Enabling bluetooth...')
		output, status, type, rc = hs.execute('blueutil power 1', true)
	else
		hs.alert.show('Disabling bluetooth...')
		output, status, type, rc = hs.execute('blueutil power 0', true)
	end

	lastNumberOfScreens = newNumberOfScreens
	if rc ~= 0 then
		hs.alert.show('Error toggling bluetooth: '..(exit))
	end
end

screenWatcher = hs.screen.watcher.new(screenWatchCallback)
screenWatcher:start()

-- Reload Hammerspoon config
hs.hotkey.bind(mashall, 'R', function()
	hs.reload()
end)
hs.alert.show("Config loaded")
