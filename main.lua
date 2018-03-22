-- 
-- main.lua
-- Copyright (c) 2018 Corona Labs Inc. All rights reserved.
--
-- A sample of using JS native plugin for Corona

local widget = require( "widget" )
local json = require( "json" )
local myplugin = require("myplugin")

local label = display.newText( "output", 50, 220, native.systemFont, 16 )
label.x = display.contentCenterX
local data = native.newTextBox(160, 360, 320, 250)
data.isEditable = false

-- JS event listener.
local function pluginListener( event )
    local str = json.prettify(event)
    str = 'got event from JS plugin:\n' .. str
    print(str)
    data.text = str
end

local setData = function()
	-- call JS native plugin
	-- arg value maybe boolean, number, string, table
	-- 
	local bool_arg = true
	local number_arg = 123
	local string_arg = 'abc'
	local table_arg = {key1='key1value', key2={1,2,3}}
	local array_arg = {1,2,3,4,5,6,7}
	myplugin.set(bool_arg, number_arg, string_arg, table_arg, array_arg)
end

local getData = function()
	-- call JS native plugin
	local tbl = myplugin.get()
	if tbl then
	    local str = json.prettify(tbl)

-- Important: use index-debug.html if you want to see print output
		print('Data: ', str)

		data.text = str
	end
end

-- event listener, it's an option
myplugin.addEventListener(pluginListener)

widget.newButton { onRelease = setData, left=60, top=60, width=200, height=50, defaultFile = "buttonRed.png", overFile = "buttonRedOver.png", label = "Save Data in JS", emboss = true,labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } } }
widget.newButton { onRelease = getData, left=60, top=120, width=200, height=50, defaultFile = "buttonRed.png", overFile = "buttonRedOver.png", label = "Read Saved Data", emboss = true, labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } } }

--