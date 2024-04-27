--[=[
    @function Image
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


type ImageProps = GlobalTypes.BaseComponents & {
    BackgroundTransparency: number?,
    Image: string?,
    Color: string | Color3?,
    ImageColor: string | Color3?,
    ImageColor3: string | Color3?,
    Transparency: number?,
}

function Image(props: ImageProps): ImageLabel
    return constructor("Image", "ImageLabel", {
        "Transparency",
        "Color",
		"ImageColor",
    }, {
        BackgroundTransparency =  1,
        Image = Constants.NO_ICON_URL,
        ImageColor3 = checkTheme(props.Color)
            or checkTheme(props.ImageColor)
            or checkTheme(props.ImageColor3)
            or Basics.Image.ImageColor,
        ImageTransparency = props.Transparency, 
    }) (props)
end

return Image
