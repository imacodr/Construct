--[=[
    @function Portal
    @within Components
    This is a component that extends Frame and is used to display children outside of the hiearchy on a custom haven.
        
    @param props ImageProps -- The properties to create the image component
    @return Instance -- Returns the generated Image component
--]=]
        
local HttpService = game:GetService("HttpService")

local Core = script.Parent.Parent.Core
local Utils = script.Parent.Parent.Utils

local constructor = require(Core.constructor)
local FactoryNew = require(Core.FactoryNew)
local checkTheme = require(Core.themeManager).checkTheme

local Logger = require(Utils.loggers)

local GlobalTypes = require(script.Parent.Parent.GlobalTypes)

export type PortalProps = GlobalTypes.BaseComponents & {
	BackgroundTransparency: number?,
	BackgroundColor: string | Color3Value?,
	Bg: string | Color3Value?,
    As: "Frame" | "CanvasGroup",
    Provider: Instance?
}

function Portal(props: PortalProps): Instance
    local class = props.As or "Frame"

    if class ~= "Frame" and class ~= "CanvasGroup" then
        Logger.logError("invalidClassWhenAssimilating", class, "Portal", "Frame or CanvasGroup")
    end

    local parent: Instance
    local portalId: number

    local ok,result = pcall(HttpService.GenerateGUID, HttpService, false)
	if ok then
		portalId = result
	else
		Logger.logWarning("toastUUIDCatch", result)
		portalId = math.random(1,1000000000)
	end

    local portal = constructor("Portal", class, {
       "As",
       "Provider",
    }, {
        Name = "customHaven_" .. portalId or "customHaven",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        PrePosition = "center",
    }) (props)


    if props.Provider then
		parent = props.Provider:WaitForChild("ConstructPortal")
	else
		parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("ConstructBuilder"):WaitForChild("ConstructPortal")
	end

    portal.Parent = parent
    return portal
end

return Portal