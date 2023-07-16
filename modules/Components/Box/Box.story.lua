local Box = require(script.Parent)

return {
	summary = "A basic frame",
	story = function(parent)
		return Box({
			Parent = parent,
			PreSize = "xl",
			PrePosition = "topLeft",
			BackgroundColor = Color3.fromRGB(255, 0, 0),
		})
	end,
}
