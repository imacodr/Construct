--[[
    PodKit - A UI Framework based on Fusion.
		~Core - A collection of core components that are used to build the PodKit framework.

	This file is the entry point for the PodKit Core module.
--]]

local PodKitCore = {
	PodKitProvider = require(script.KitProvider),
	extendTheme = require(script.extendTheme),
	Cool = require(script.Cool),
	Fusion = require(script.Parent.Parent.Fusion),
}

return PodKitCore
