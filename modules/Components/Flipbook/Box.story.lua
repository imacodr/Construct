local Box = require(script.Parent.Parent.Box)

return {
	summary = "A generic container component",
	story = function()
		return Box({
			Bg = Color3.fromRGB(255, 0, 0),
		})
	end,
}
