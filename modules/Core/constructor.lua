local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

-- Fusion
local New = Fusion.New
local Children = Fusion.Children
local ForPairs = Fusion.ForPairs

local Utils = require(script.Parent.Parent.Utils)
local Basics = Utils.Basics

local checkPosition = require(script.Parent.Parent.Utils.CheckConfig).checkPosition
local checkSize = require(script.Parent.Parent.Utils.CheckConfig).checkSize
local checkAnchorPoint = require(script.Parent.Parent.Utils.CheckConfig).checkAnchorPoint
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
    return function (props) : Instance
       local finalProps = mergeProps(defaultProps, props)
        
        local size = checkSize(componentName, finalProps.PreSize)
        finalProps.PreSize = nil
        local position = checkPosition(finalProps)
        finalProps.PrePosition = nil
        local anchorPoint = checkAnchorPoint(finalProps) or position.AnchorPoint

        local paddingTop = finalProps.PaddingTop or finalProps.PaddingY or finalProps.Padding or UDim.new(0, 0)
        local paddingBottom = finalProps.PaddingBottom or finalProps.PaddingY or finalProps.Padding or UDim.new(0, 0)
        local paddingLeft = finalProps.PaddingLeft or finalProps.PaddingX or finalProps.Padding or UDim.new(0, 0)
        local paddingRight = finalProps.PaddingRight or finalProps.PaddingX or finalProps.Padding or UDim.new(0, 0)
        finalProps.PaddingTop = nil
        finalProps.PaddingBottom = nil
        finalProps.PaddingLeft = nil
        finalProps.PaddingRight = nil
        finalProps.PaddingY = nil
        finalProps.PaddingX = nil
        finalProps.Padding = nil

        local backgroundColor = checkTheme(finalProps.BackgroundColor3) or checkTheme(finalProps.BackgroundColor) or checkTheme(finalProps.Bg) or Basics[componentName].Bg
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
                New "UIPadding" {
                    PaddingTop = paddingTop,
                    PaddingBottom = paddingBottom,
                    PaddingLeft = paddingLeft,
                    PaddingRight = paddingRight,
                },
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
