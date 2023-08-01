--[=[
    @function Box
    @within Components
    This is a component that extends ImageLabel and is used to display images on the screen.

    @param props BoxProps -- The properties to create the image component
    @return Instance -- Returns the generated Image component
]=]

local GlobalTypes = script.Parent.Parent.GlobalTypes

local Core = script.Parent.Parent.Core

local constructor = require(Core.constructor)
export type BoxProps = GlobalTypes.BaseComponents & {
	BackgroundTransparency: number?,
	BackgroundColor: string | Color3Value?,
	Bg: string | Color3Value?,
}

function Box(props: BoxProps): Instance
	return constructor("Box", "Frame", {
	}, {}) (props)
end

return Box
