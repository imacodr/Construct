local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Children = Fusion.Children

local New = Fusion.New

local Types = script.Parent.Parent.Types

function KitProvider(props: Types.KitProviderProps)
	local player = game.Players.LocalPlayer

	local GuiType = props.GuiType or "ScreenGui"

	local children = props[Children]

	props[Children] = {
		New("Frame")({
			Name = "ConstructPortal",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
		}),
		children,
	}

	props.Name = "Construct_" .. props.Id or "ConstructBuilder"
	props.Parent = props.Parent or player:WaitForChild("PlayerGui")
	props.Id = nil
	props.GuiType = nil

	return New(GuiType)(props)
end

return KitProvider
