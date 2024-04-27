local Packages = script.Parent.Parent.Parent.Parent

local Children = require(Packages.Fusion).Children

local Stack = require(game.ReplicatedStorage.Packages.Construct.Components.Stack)
local Button = require(game.ReplicatedStorage.Packages.Construct.Components.Button)

return {
	summary = "A basic frame",
	story = function(parent)
		return Stack({
			Parent = parent,
			PreSize = "full",
			BackgroundTransparency = 1,
			PrePosition = "topLeft",
			[Children] = {
				Button({
					PreSize = "xxl",
					PrePosition = "topLeft",
					Text = "Hello World!",
				}),
				Button({
					PreSize = "xxl",
					PrePosition = "topLeft",
					Text = "Hello World!",
				}),
			},
		})
	end,
}
