local GlobalTypes = require(script.Parent.Parent.GlobalTypes)

local Core = script.Parent.Parent.Core
local Utils = script.Parent.Parent.Utils

local constructor = require(Core.constructor)

local Logger = require(Utils.loggers)
export type BoxProps = GlobalTypes.BaseComponents & {
	BackgroundTransparency: number?,
	BackgroundColor: string | Color3Value?,
	Bg: string | Color3Value?,
    As: "Frame" | "CanvasGroup"?
}

--[=[
    @function Box
    @within Components
    This is a component that extends ImageLabel and is used to display images on the screen.

    @param props BoxProps -- The properties to create the image component
    @return Instance -- Returns the generated Image component
]=]
function Box(props: BoxProps): Instance
    local class = props.As or "Frame"

    if class ~= "Frame" and class ~= "CanvasGroup" then
        Logger.logError("invalidClassWhenAssimilating", class, "Box", "Frame or CanvasGroup")
    end

	return constructor("Box", class, {
        "As"
	}, {}) (props)
end

return Box
