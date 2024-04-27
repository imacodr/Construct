local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Children = Fusion.Children

local New = Fusion.New

local GlobalTypes = script.Parent.Parent.GlobalTypes

function Provider(props: GlobalTypes.KitProviderProps)
	local player = game.Players.LocalPlayer

	local GuiType = props.GuiType or "ScreenGui"

	local children = props[Children]

	props[Children] = {
		New("Frame")({
			Name = "ConstructPortal",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 99,
		}),
		children,
	}

	if props.Id ~= nil then
		props.Name = "Construct_" .. props.Id
	else
		props.Name = "ConstructBuilder"
	end
	props.Parent = props.Parent or player:WaitForChild("PlayerGui")
	props.IgnoreGuiInset = props.IgnoreGuiInset or true
	props.Id = nil
	props.GuiType = nil

	return New(GuiType)(props)
end

return Provider
