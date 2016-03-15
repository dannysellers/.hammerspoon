-- Window movement
-- Left = 0
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Left', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.w = max.w / 2
	win:setFrame(f)
end)

-- Left = 1/2 vw
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Right', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.w = max.w / 2
	win:setFrame(f)
end)

-- Top = 0; height = 1/2 vh
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y
	f.h = max.h / 2
	win:setFrame(f)
end)

-- Top = 1/2 vw; height = 1/2 vh;
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Down', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.y = max.y + (max.h / 2)
	f.h = max.h /2
	win:setFrame(f)
end)

-- --------------------------------------

-- Move top upwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.y = f.y - dh
	f.h = f.h + dh
	win:setFrame(f)
end)

-- Move top downards 1/8 screen
hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'Down', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.y = f.y + dh
	f.h = f.h - dh
	win:setFrame(f)
end)

-- Move bottom upwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt'}, 'Up', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.h = f.h - dh	
	win:setFrame(f)
end)

-- Move bottom downwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt'}, 'Down', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dh = max.h / 8
	f.h = f.h + dh
	win:setFrame(f)
end)

-- Move right leftwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt'}, 'Left', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.w = f.w - dw
	win:setFrame(f)
end)

-- Move right rightwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt'}, 'Right', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.w = f.w + dw
	win:setFrame(f)
end)

-- Move left leftwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'Left', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	local dw = max.w / 8
	f.x = f.x - dw
	f.w = f.w + dw	
	win:setFrame(f)
end)

-- Move left rightwards 1/8 screen
hs.hotkey.bind({'cmd', 'alt', 'shift'}, 'Right', function()
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
hs.hotkey.bind({'shift', 'cmd', 'alt', 'ctrl'}, 'Up', function()
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

-- Reload Hammerspoon config
hs.hotkey.bind({'cmd', 'alt', 'ctrl', 'shift'}, 'R', function()
	hs.reload()
end)
hs.alert.show("Config loaded")
