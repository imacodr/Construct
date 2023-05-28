--[[
    Construct - A UI Framework based on Fusion.
		~Core - A collection of core components that are used to build the Construct framework.

	This file is the entry point for the Construct Core module.
--]]

local ConstructCore = {
	Provider = require(script.KitProvider),
	extendTheme = require(script.ThemeManager).extendTheme,
	Cool = require(script.Cool),
	Fusion = require(script.Parent.Parent.Fusion),
}

return ConstructCore
