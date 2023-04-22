local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Types = script.Parent.Parent.Types

local Basics = require(script.Parent.Parent.Utils.Basics)

function Box(props: Types.BoxProps): Child
	local anchorPoint = props.AnchorPoint

	local position = Basics.Positions[props.PrePosition] or {
		x = 0,
		y = 0,
	}
	local size = Basics.Box.Sizes[props.PreSize]

	if props.Position == nil and props.PrePosition ~= nil and props.AnchorPoint == nil then
		anchorPoint = Vector2.new(position.x, position.y)
	end

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0, 0)

	return New("Frame")({
		Name = props.Name or "Box",
		Position = props.Position or UDim2.fromScale(position.x, position.y),
		Size = props.Size or size or UDim2.fromScale(0.2, 0.15),
		AnchorPoint = anchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,
		BackgroundTransparency = props.BackgroundTransparency,

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

return Box
