local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Types = script.Parent.Parent.Types

local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint

local Basics = require(script.Parent.Parent.Utils.Basics)
local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme

function Box(props: Types.BoxProps): Child
	local size = checkSize("Box", props.PreSize)
	local position = checkPosition(props)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0, 0)

	return New("Frame")({
		Name = props.Name or "Box",
		Position = props.Position or position.Position,
		Size = props.Size or size or UDim2.fromScale(0.2, 0.15),
		AnchorPoint = checkAnchorPoint(props) or position.AnchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,
		Parent = props.Parent,
		BackgroundColor3 = checkTheme(props.BackgroundColor) or checkTheme(props.Bg) or Basics.Box.Bg,
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
