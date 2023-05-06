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

local Basics = require(script.Parent.Parent.Utils).Constants.THEME_VARIABLE
local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint

local Types = script.Parent.Parent.Types

function IconButton(props: Types.IconButtonProps): Child
	if props.Disabled == nil then
		props.Disabled = Value(false)
	elseif typeof(props.Disabled) == "boolean" then
		props.Disabled = Value(props.Disabled)
	end

	local isHovering = Value(false)
	local isHeldDown = Value(false)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0.5, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0.5, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0.5, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0.5, 0)

	local transparency = 0
	if props.Variant == "ghost" then
		transparency = 1
	end

	return New("ImageButton")({
		Name = props.Name or "IconButton",
		Position = props.Position or checkPosition(props).Position,
		Size = props.Size or checkSize("IconButton", props.PreSize),
		LayoutOrder = props.LayoutOrder,
		AnchorPoint = checkAnchorPoint(props) or checkPosition(props).AnchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,
		Parent = props.Parent,
		BackgroundTransparency = transparency,

		Image = props.Icon or Utils.Constants.NO_ICON_URL,
		ImageColor3 = checkTheme(props.IconColor) or checkTheme(props.IconColour) or Basics.IconButton.IconColor,

		BackgroundColor3 = Spring(
			Computed(function()
				local baseColor = checkTheme(props.BackgroundColor) or checkTheme(props.Bg) or Basics.IconButton.Bg
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
			New("UIAspectRatioConstraint")({
				AspectRatio = props.AspectRatio or 1,
			}),
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
return IconButton
