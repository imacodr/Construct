--[[
    Construct - The ultimate component library for Fusion with next level theming capabilities.
		~Core - A collection of core components that are used to build the Construct framework.

	This file is the entry point for the Construct Core module.
--]]

local ConstructCore = {
	Provider = require(script.Provider),
	extendTheme = require(script.ThemeManager).extendTheme,
	New = require(script.FactoryNew),
	Fusion = require(script.Parent.Parent.Fusion),
}

return ConstructCore
