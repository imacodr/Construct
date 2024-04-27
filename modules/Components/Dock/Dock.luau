local Packages = script.Parent.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Children = Fusion.Children

local New = Fusion.New

local Box = require(script.Parent.Parent.Box)

local GlobalTypes = script.Parent.Parent.GlobalTypes

--[[
	Dock & DockItems is still a work in progress. It is not yet implemented in the library.
--]]

function Dock(props: GlobalTypes.DockProps)
	return Box({
		PreSize = "full",
		PrePosition = "topLeft",
		BackgroundTransparency = 1,
		[Children] = props[Children],
	})
end
return Dock
