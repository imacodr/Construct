--[=[
	@function Text
	@within Components
	This is a component that extends TextLabel and is used to display text on the screen.

	@param props TextProps -- The properties to create the Text component
	@return Instance -- Returns the generated Text component
]=]

local Core = script.Parent.Parent.Core

local constructor = require(Core.constructor)
local checkTheme = require(Core.themeManager).checkTheme

local GlobalTypes = require(script.Parent.Parent.GlobalTypes)

local Basics = require(script.Parent.Parent.Utils.Basics)


type TextProps = GlobalTypes.BaseComponents & {
	Padding: ({ [number]: number } | number)?,
	Bg: GlobalTypes.ThemedProp?,
	BackgroundColor: GlobalTypes.ThemedProp?,
	TextColor: GlobalTypes.ThemedProp?,
	OnHoverStart: () -> any?,
	OnHoverEnd: () -> any?,
	Text: string?,
	FontFace: Font?,
	Font: Font?,
}


function Text(props: TextProps): Instance
	return constructor("Text", "TextLabel", {
		"Font",
		"TextColor",
	}, {
		FontFace = checkTheme(props.FontFace) or checkTheme(props.Font) or Basics.Text.Font,
		TextColor3 = checkTheme(props.TextColor) or Basics.Text.TextColor,
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		RichText = true,
		TextWrapped = true,
		BackgroundTransparency = 1,
	}) (props)
end

return Text
