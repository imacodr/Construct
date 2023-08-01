--[[
    Construct - The ultimate component library for Fusion with next level theming capabilities.
		~Construct - A collection of modules that can be used to build a UI.

	This file is the entry point for the Construct module.
	
	Created by imacodr with love <3
--]]

local Construct = {
	Core = require(script.Core),
	Components = require(script.Components),
	Import = require(script.Import),
	_internal = {
		Utils = require(script.Utils),
		FusionPubTypes = require(script.PubTypes),
		GlobalTypes = require(script.GlobalTypes),
	}
}

return Construct
