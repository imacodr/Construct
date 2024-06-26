local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local GlobalTypes = require(script.Parent.Parent.GlobalTypes)

local Box = require(script.Parent.Box)

local Utils = require(script.Parent.Parent.Utils)
local Basics = Utils.Basics
local Logger = Utils.loggers

function Stack(props: GlobalTypes.StackProps)
	local position = props.PrePosition
	local horizontalAlignment = Enum.HorizontalAlignment.Center
	local verticalAlignment = Enum.VerticalAlignment.Center

	if position then
		if position == "center" then
			horizontalAlignment = Enum.HorizontalAlignment.Center
			verticalAlignment = Enum.VerticalAlignment.Center
		elseif position == "topLeft" then
			horizontalAlignment = Enum.HorizontalAlignment.Left
			verticalAlignment = Enum.VerticalAlignment.Top
		elseif position == "topRight" then
			horizontalAlignment = Enum.HorizontalAlignment.Right
			verticalAlignment = Enum.VerticalAlignment.Top
		elseif position == "bottomLeft" then
			horizontalAlignment = Enum.HorizontalAlignment.Left
			verticalAlignment = Enum.VerticalAlignment.Bottom
		elseif position == "bottomRight" then
			horizontalAlignment = Enum.HorizontalAlignment.Right
			verticalAlignment = Enum.VerticalAlignment.Bottom
		elseif position == "bottomCenter" then
			horizontalAlignment = Enum.HorizontalAlignment.Center
			verticalAlignment = Enum.VerticalAlignment.Bottom
		elseif position == "topCenter" then
			horizontalAlignment = Enum.HorizontalAlignment.Center
			verticalAlignment = Enum.VerticalAlignment.Top
		end
	end

	local children = props[Children]
	props[Children] = {
		New("UIListLayout")({
			FillDirection = props.Direction or Enum.FillDirection.Horizontal,
			HorizontalAlignment = props.HorizontalAlignment or horizontalAlignment,
			VerticalAlignment = props.VerticalAlignment or verticalAlignment,
			SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder,
			Padding = props.Spacing or UDim.new(0.01, 0),
		}),
		children,
	}

	props.Spacing = nil
	props.Direction = nil
	props.HorizontalAlignment = nil
	props.VerticalAlignment = nil
	props.Name = props.Name or "Stack"

	return Box(props)
end

function VStack(props: GlobalTypes.StackProps)
	if not props.Direction then
		props.Direction = Enum.FillDirection.Vertical
	end
	return Stack(props)
end

return {
	Stack = Stack,
	VStack = VStack,
}
