local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Basics = require(script.Parent.Parent.Utils).Constants.THEME_VARIABLE

local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint

local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme

local GlobalTypes = script.Parent.Parent.GlobalTypes

function Button(props: GlobalTypes.ButtonProps): Child
	if props.Disabled == nil then
		props.Disabled = Value(false)
	elseif typeof(props.Disabled) == "boolean" then
		props.Disabled = Value(props.Disabled)
	end

	local isHovering = Value(false)
	local isHeldDown = Value(false)

	local size = checkSize("Button", props.PreSize)
	local position = checkPosition(props)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0.1, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0.1, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0.1, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0.1, 0)

	return New("TextButton")({
		Name = props.Name or "Button",
		Position = props.Position or position.Position,
		Size = props.Size or size,
		Parent = props.Parent,
		LayoutOrder = props.LayoutOrder,
		AnchorPoint = checkAnchorPoint(props) or position.AnchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,

		FontFace = checkTheme(props.Font) or Basics.Button.Font,
		TextColor3 = checkTheme(props.TextColor) or Basics.Button.TextColor,
		TextScaled = props.TextScaled or true,
		TextSize = props.TextSize,
		TextWrapped = props.TextWrapped or true,
		Text = props.Text,
		TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center,
		TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center,

		BackgroundColor3 = Spring(
			Computed(function()
				local baseColor = checkTheme(props.BackgroundColor) or checkTheme(props.Bg) or Basics.Button.Bg
				if props.Disabled:get() then
					baseColor = baseColor:Lerp(Color3.fromHex("CCCCCC"), 0.7)
					return baseColor
				else
					-- darken/lighten when hovered or held down
					if isHeldDown:get() then
						baseColor = baseColor:Lerp(Color3.new(0, 0, 0), 0.25)
					elseif isHovering:get() then
						baseColor = baseColor:Lerp(Color3.new(1, 1, 1), 0.25)
					end
					return baseColor
				end
			end),
			20
		),

		BorderSizePixel = 0,

		[Children] = {
			New("UICorner")({
				CornerRadius = props.CornerRadius or UDim.new(0.3, 0),
			}),
			New("UIPadding")({
				PaddingTop = paddingTop,
				PaddingBottom = paddingBottom,
				PaddingLeft = paddingLeft,
				PaddingRight = paddingRight,
			}),
			props[Children],
		},

		[OnEvent("MouseButton1Click")] = function()
			if not props.Disabled:get() then
				if props.OnClick ~= nil then
					props.OnClick()
				end
			end
		end,

		[OnEvent("MouseButton1Down")] = function()
			if not props.Disabled:get() then
				isHeldDown:set(true)
			end
		end,

		[OnEvent("MouseButton1Up")] = function()
			if not props.Disabled:get() then
				isHeldDown:set(false)
			end
		end,

		[OnEvent("MouseEnter")] = function()
			if props.OnHoverStart ~= nil then
				props.OnHoverStart()
				return
			end
			if not props.Disabled:get() then
				isHovering:set(true)
			end
		end,

		[OnEvent("MouseLeave")] = function()
			if props.OnHoverEnd ~= nil then
				props.OnHoverEnd()
				return
			end
			if not props.Disabled:get() then
				isHovering:set(false)
			end
		end,
	})
end
return Button
