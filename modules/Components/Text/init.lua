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
local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme

local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint

function Text(props: Types.TextProps): Child
	local size = checkSize("Box", props.PreSize)
	local position = checkPosition(props)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0, 0)

	return New("TextLabel")({
		Name = props.Name or "Text",
		Position = props.Position or position.Position,
		Size = props.Size or size,
		AnchorPoint = checkAnchorPoint(props) or position.AnchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,
		Parent = props.Parent,

		FontFace = checkTheme(props.Font) or Basics.Text.Font,
		TextColor3 = checkTheme(props.TextColor) or Basics.Text.TextColor,
		TextScaled = props.TextScaled or true,
		TextSize = props.TextSize,
		RichText = props.RichText or true,
		TextWrapped = props.TextWrapped or true,
		Text = props.Text,
		TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Left,
		TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center,

		BackgroundColor3 = checkTheme(props.BackgroundColor) or checkTheme(props.Bg) or Basics.Text.Bg,
		BackgroundTransparency = props.BackgroundTransparency or 1,

		[Children] = {
			New("UIPadding")({
				PaddingTop = paddingTop,
				PaddingBottom = paddingBottom,
				PaddingLeft = paddingLeft,
				PaddingRight = paddingRight,
			}),
			props[Children],
		},

		[OnEvent("MouseEnter")] = function()
			if props.OnHoverStart ~= nil then
				props.OnHoverStart()
				return
			end
		end,

		[OnEvent("MouseLeave")] = function()
			if props.OnHoverEnd ~= nil then
				props.OnHoverEnd()
				return
			end
		end,
	})
end

return Text