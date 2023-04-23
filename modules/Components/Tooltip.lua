local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Children = Fusion.Children

local New = Fusion.New

local Box = require(script.Parent.Box)
local Text = require(script.Parent.Text)

local Types = script.Parent.Parent.Types

local Basics = require(script.Parent.Parent.Utils.Basics)
local checkTheme = require(script.Parent.Parent.Core.themeManager).checkTheme

--[[
	Tooltip is still a work in progress. It is not yet implemented in the library.
--]]

function Tooltip(props: Types.TooltipProps): Child
	local tooltip = Box({
		PrePosition = "bottomCenter",
		Size = UDim2.fromOffset(130, 50),
		PaddingTop = UDim.new(0.1, 0),
		[Children] = {
			New("UICorner")({
				CornerRadius = UDim.new(0.2, 0),
			}),
			Text({
				PreSize = "full",
				Text = "Hello",
				PrePosition = "center",
			}),
		},
	})

	return tooltip
end

return Tooltip
