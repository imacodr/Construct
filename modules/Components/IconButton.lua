local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Utils = require(script.Parent.Parent.Utils)

local Basics = Utils.Basics
local Constants = Utils.Constants

local Types = script.Parent.Parent.Types

function IconButton(props: Types.IconButtonProps): Child
	if props.Disabled == nil then
		props.Disabled = Value(false)
	elseif typeof(props.Disabled) == "boolean" then
		props.Disabled = Value(props.Disabled)
	end

	local isHovering = Value(false)
	local isHeldDown = Value(false)

	local anchorPoint = props.AnchorPoint

	local position = Basics.Positions[props.PrePosition] or {
		x = 0,
		y = 0,
	}
	local size = Basics.IconButton.Sizes[props.PreSize] or UDim2.fromScale(0.2, 0.15)

	local paddingTop = props.PaddingTop or props.PaddingY or props.Padding or UDim.new(0.5, 0)
	local paddingBottom = props.PaddingBottom or props.PaddingY or props.Padding or UDim.new(0.5, 0)
	local paddingLeft = props.PaddingLeft or props.PaddingX or props.Padding or UDim.new(0.5, 0)
	local paddingRight = props.PaddingRight or props.PaddingX or props.Padding or UDim.new(0.5, 0)

	if props.PrePosition ~= nil and props.AnchorPoint == nil then
		anchorPoint = Vector2.new(position.x, position.y)
	end

	local transparency = 0
	if props.Variant == "ghost" then
		transparency = 1
	end

	return New("ImageButton")({
		Name = props.Name or "IconButton",
		Position = props.Position or UDim2.fromScale(position.x, position.y),
		Size = props.Size or size,
		LayoutOrder = props.LayoutOrder,
		AnchorPoint = anchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,
		BackgroundTransparency = transparency,

		Image = props.Icon or Constants.NO_ICON_URL,

		BackgroundColor3 = Spring(
			Computed(function()
				local baseColour = Basics.IconButton.Bg
				if props.Disabled:get() then
					baseColour = baseColour:Lerp(Color3.fromHex("CCCCCC"), 0.7)
					return baseColour
				else
					-- darken/lighten when hovered or held down
					if isHeldDown:get() then
						baseColour = baseColour:Lerp(Color3.new(0, 0, 0), 0.25)
					elseif isHovering:get() then
						baseColour = baseColour:Lerp(Color3.new(1, 1, 1), 0.25)
					end
					return baseColour
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
