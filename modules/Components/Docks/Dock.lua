local Packages = script.Parent.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Children = Fusion.Children

local New = Fusion.New

local Box = require(script.Parent.Parent.Box)

local Types = script.Parent.Parent.Types

function Dock(props: Types.DockProps)
	return Box({
		PreSize = "full",
		PrePosition = "topLeft",
		BackgroundTransparency = 1,
		[Children] = props[Children],
	})
end
return Dock
