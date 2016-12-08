---------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------------------------------------------
local parse = require( "mod_parse" )
parse:init({ 
  appId = "l4K4kgAtTU5kQSwBZ5SIczbR310HNlAWiTUwy7Km", 
  apiKey = "ziTEzIObowaTPLwYcIrDe4GJVbyTRM68Todg4IbH"
})

parse.showStatus = true
parse:appOpened()
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- require the composer library
local composer = require "composer"

-- load scene1
composer.gotoScene( "scene1" )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc)