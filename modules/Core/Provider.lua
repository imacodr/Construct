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

			[Children] = {
				New("Frame")({
					Name = "ToastHaven",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0.99),
					ZIndex = 99,

					[Children] = {
						New "UIListLayout" {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Bottom,
							Padding = UDim.new(0.01, 0),
						},
					}
				}),
			}
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
