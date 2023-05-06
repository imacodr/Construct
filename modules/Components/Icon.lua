local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Utils = require(script.Parent.Parent.Utils)

local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme

local Basics = Utils.Basics
local Constants = Utils.Constants

local Types = script.Parent.Parent.Types

function Icon(props: Types.IconProps): Child
	local anchorPoint = props.AnchorPoint

	local position = Basics.Positions[props.PrePosition] or {
		x = 0,
		y = 0,
	}
	local size = Basics.Icon.Sizes[props.PreSize] or UDim2.fromScale(0.2, 0.15)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0.5, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0.5, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0.5, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0.5, 0)

	if props.PrePosition ~= nil and props.AnchorPoint == nil then
		anchorPoint = Vector2.new(position.x, position.y)
	end

	return New("ImageLabel")({
		Name = props.Name or "Icon",
		Position = props.Position or UDim2.fromScale(position.x, position.y),
		Size = props.Size or size,
		AnchorPoint = anchorPoint,
		BackgroundTransparency = 1,
		Image = props.Icon or Constants.NO_ICON_URL,
		ImageColor3 = checkTheme(props.Color) or checkTheme(props.Colour) or Basics.Icon.IconColor,
		ImageTransparency = props.Transparency,
		[Children] = {
			New("UIPadding")({
				PaddingTop = paddingTop,
				PaddingBottom = paddingBottom,
				PaddingLeft = paddingLeft,
				PaddingRight = paddingRight,
			}),
			props[Children],
		},
	})
end

return Icon
