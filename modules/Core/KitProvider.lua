local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Children = Fusion.Children

local New = Fusion.New

local Types = script.Parent.Parent.Types

function KitProvider(props: Types.KitProviderProps)
	local player = game.Players.LocalPlayer

	local resetOnSpawn = (props._override and props._override.resetOnSpawn) or false
	local zIndex = (props._override and props._override.ZIndexBehavior) or Enum.ZIndexBehavior.Sibling
	local guiInset = (props._override and props._override.IgnoreGuiInset) or true

	local GuiType = props.GuiType or "ScreenGui"

	_G.PODKIT_THEME = props.Theme
	print("Provider")

	return New(GuiType)({
		Name = "PodKitBuilder",
		Parent = player:WaitForChild("PlayerGui"),
		ResetOnSpawn = resetOnSpawn,
		ZIndexBehavior = zIndex,
		IgnoreGuiInset = guiInset,
		props._override,
		[Children] = props[Children],
	})
end

return KitProvider
