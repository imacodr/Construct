local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Spring = Fusion.Spring

local Utils = require(script.Parent.Parent.Utils)

local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint

local Basics = Utils.Basics
local Constants = Utils.Constants

local Types = script.Parent.Parent.Types

local constructor = require(script.Parent.constructor)

type ImageProps = Types.BaseComponents & {
    BackgroundTransparency: number?,
    Image: string?,
    ImageColor: Color3?,
    ImageColor3: Color3?,
    Transparency: number?,
}



function Image(props: ImageProps): ImageLabel
    return constructor("Image", "ImageLabel", {
        "Transparency"
    }, {
        BackgroundTransparency =  1,
        Image = Constants.NO_ICON_URL,
        ImageColor3 = checkTheme(props.Color)
            or checkTheme(props.Colour)
            or checkTheme(props.ImageColor)
            or checkTheme(props.ImageColor3)
            or Basics.Image.ImageColor,
        ImageTransparency = props.Transparency, 
    }) (props)
end

return Image
