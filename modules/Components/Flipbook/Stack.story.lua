local Packages = script.Parent.Parent.Parent.Parent

local Children = require(Packages.Fusion).Children

local Stack = require(script.Parent.Parent.Stack).Stack
local Button = require(script.Parent.Parent.Button)

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
