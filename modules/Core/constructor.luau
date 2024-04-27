local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

-- Fusion
local New = Fusion.New
local Children = Fusion.Children
local Computed = Fusion.Computed

local Utils = require(script.Parent.Parent.Utils)
local CheckConfig = require(script.Parent.Parent.Utils.CheckConfig)
local Basics = Utils.Basics

local PubTypes = script.Parent.Parent.PubTypes

local checkPosition = CheckConfig.checkPosition
local checkSize = CheckConfig.checkSize
local checkAnchorPoint = CheckConfig.checkAnchorPoint
local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme

function mergeProps(defaultProps, props)
    local finalProps = {}
    for k,v in pairs(defaultProps) do
        finalProps[k] = v
    end
    for k,v in pairs(props) do
        finalProps[k] = v
    end
    return finalProps
end

function constructor(componentName: string, class: string, customProps: table, defaultProps: table)
    return function (props: PubTypes.PropertyTable) : Instance
       local finalProps = mergeProps(defaultProps, props)
        
        local size = checkSize(componentName, finalProps.PreSize)
        finalProps.PreSize = nil
        local position = checkPosition(finalProps)
        finalProps.PrePosition = nil
        local anchorPoint = checkAnchorPoint(finalProps) or position.AnchorPoint
        finalProps.AnchorPoint = nil
        
        local paddingTop = finalProps.PaddingTop or finalProps.PaddingY or finalProps.Padding
        local paddingBottom = finalProps.PaddingBottom or finalProps.PaddingY or finalProps.Padding
        local paddingLeft = finalProps.PaddingLeft or finalProps.PaddingX or finalProps.Padding
        local paddingRight = finalProps.PaddingRight or finalProps.PaddingX or finalProps.Padding
        finalProps.PaddingTop = nil
        finalProps.PaddingBottom = nil
        finalProps.PaddingLeft = nil
        finalProps.PaddingRight = nil
        finalProps.PaddingY = nil
        finalProps.PaddingX = nil
        finalProps.Padding = nil

        local cornerRadius

        if typeof(finalProps.CornerRadius) == "number" then
            cornerRadius = UDim.new(0, finalProps.CornerRadius)
        elseif typeof(finalProps.CornerRadius) == "UDim" then
            cornerRadius = finalProps.CornerRadius
        end
        finalProps.CornerRadius = nil

        local paddingInstance
        if paddingTop or paddingBottom or paddingLeft or paddingRight then
            paddingInstance = New "UIPadding" {
                PaddingTop = paddingTop,
                PaddingBottom = paddingBottom,
                PaddingLeft = paddingLeft,
                PaddingRight = paddingRight,
            }
        end

        local cornerInstance
        if cornerRadius then
            cornerInstance = New "UICorner" {
                CornerRadius = cornerRadius,
            }
        end
     


        local backgroundColor = checkTheme(finalProps.BackgroundColor3)
            or checkTheme(finalProps.BackgroundColor)
            or checkTheme(finalProps.Bg)
            or Basics[componentName].Bg

        finalProps.BackgroundColor3 = nil
        finalProps.BackgroundColor = nil
        finalProps.Bg = nil

        local children = finalProps[Children]
        finalProps[Children] = nil
    
        for _, v in pairs(customProps) do
            finalProps[v] = nil
        end
        
        local instanceProps = {
            Name = finalProps.Name or componentName,
            Position = finalProps.Position or position.Position,
            Size = finalProps.Size or size,
            AnchorPoint = anchorPoint,
            BackgroundColor3 = backgroundColor,

            [Children] = {
                paddingInstance,
                cornerInstance,
                children
            },
        }

        for k, v in pairs(finalProps) do
            instanceProps[k] = v
        end

        local instance = New (class)(instanceProps)

        return instance
    end
end

return constructor
