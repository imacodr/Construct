local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Basics = _G.PODKIT_THEME

local checkTheme = require(script.Parent.Parent.Core.themeManager).checkTheme

local Types = script.Parent.Parent.Types

function Button(props: Types.ButtonProps): Child
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
	local size = Basics.Button.Sizes[props.PreSize] or UDim2.fromScale(0.2, 0.15)

	if props.PrePosition ~= nil and props.AnchorPoint == nil then
		anchorPoint = Vector2.new(position.x, position.y)
	end

	return New("TextButton")({
		Name = props.Name or "Button",
		Position = props.Position or UDim2.fromScale(position.x, position.y),
		Size = props.Size or size,
		Parent = props.Parent,
		LayoutOrder = props.LayoutOrder,
		AnchorPoint = anchorPoint,
		AutomaticSize = props.AutomaticSize,
		ZIndex = props.ZIndex,

		FontFace = checkTheme(props.FontFace) or Basics.Button.Font,
		TextColor3 = checkTheme(props.TextColor) or Basics.Button.TextColor,
		TextScaled = props.TextScaled or true,
		TextSize = props.TextSize,
		TextWrapped = props.TextWrapped or true,
		Text = props.Text,

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
				CornerRadius = UDim.new(0.3, 0),
			}),
			New("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0.1, 0),
				PaddingLeft = UDim.new(0.1, 0),
				PaddingRight = UDim.new(0.1, 0),
				PaddingTop = UDim.new(0.1, 0),
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
