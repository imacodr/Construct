--[=[
	@function Icon
	@within Components
	This is a component that extends ImageLabel and is used to display images on the screen.

	@param props ImageProps -- The properties to create the image component
	@return Instance -- Returns the generated Image component
]=]

local Core = script.Parent.Parent.Core

local constructor = require(Core.constructor)
local checkTheme = require(Core.themeManager).checkTheme

local Utils = require(script.Parent.Parent.Utils)
local Basics = Utils.Basics
local Constants = Utils.Constants

local GlobalTypes = require(script.Parent.Parent.GlobalTypes)

function Icon(props: GlobalTypes.IconProps): Child
	return constructor("Icon", "ImageLabel", {
		"Icon",
		"Transparency",
		"IconColor",
		"Color",
		"ImageColor",
	}, {
		BackgroundTransparency = 1,
		Image = props.Icon or Constants.NO_ICON_URL,
		ImageColor3 = checkTheme(props.Color) or
			checkTheme(props.IconColor) or
			checkTheme(props.ImageColor) or
			checkTheme(props.ImageColor3) or Basics.Icon.IconColor,
		ImageTransparency = props.Transparency,
		ScaleType = Enum.ScaleType.Fit,
	}) (props)
end

return Icon
