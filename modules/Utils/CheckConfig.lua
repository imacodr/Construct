local Basics = require(script.Parent.Basics)
local Constants = require(script.Parent.Constants)

function checkAnchorPoint(props)
	if props.PrePosition == nil and typeof(props.AnchorPoint) == "string" then
		local position = Constants.THEME_VARIABLE.Positions[props.PrePosition]
			or Basics.Positions[props.PrePosition]
			or {
				x = 0,
				y = 0,
			}

		return Vector2.new(position.x, position.y)
	else
		return nil
	end
end

function checkPosition(props)
	local anchorPoint = props.AnchorPoint

	local position = Constants.THEME_VARIABLE.Positions[props.PrePosition]
		or Basics.Positions[props.PrePosition]
		or {
			x = 0,
			y = 0,
		}

	if props.PrePosition ~= nil and props.AnchorPoint == nil then
		anchorPoint = Vector2.new(position.x, position.y)
	end

	return {
		Position = props.Position or UDim2.fromScale(position.x, position.y),
		AnchorPoint = anchorPoint,
	}
end

function checkSize(component, size)
	return Constants.THEME_VARIABLE[component].Sizes[size]
		or Basics[component].Sizes[size]
		or UDim2.fromScale(0.2, 0.15)
end

return {
	checkPosition = checkPosition,
	checkSize = checkSize,
	checkAnchorPoint = checkAnchorPoint,
}
