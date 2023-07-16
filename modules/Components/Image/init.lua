local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Utils = require(script.Parent.Parent.Utils)

local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint

local Basics = Utils.Basics
local Constants = Utils.Constants

local Types = script.Parent.Parent.Types

function Image(props: Types.ImageProps): Child
	local size = checkSize("Image", props.PreSize)
	local position = checkPosition(props)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0, 0)

	return New("ImageLabel")({
		Name = props.Name or "Image",
		Position = props.Position or position.Position,
		Size = props.Size or size,
		AnchorPoint = checkAnchorPoint(props) or position.AnchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		Image = props.Image or Constants.NO_ICON_URL,
		ImageColor3 = checkTheme(props.Color)
			or checkTheme(props.Colour)
			or checkTheme(props.ImageColor)
			or checkTheme(props.ImageColor3)
			or Basics.Image.ImageColor,
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

return Image
