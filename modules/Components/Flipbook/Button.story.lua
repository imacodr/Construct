local Button = require(script.Parent.Parent.Button)

return {
	summary = "A button component",
	story = function()
		return Button({
			Size = UDim2.fromScale(0.3, 0.25),
			Position = UDim2.fromScale(0.25, 0.25),
			Text = "Hello World!",
		})
	end,
}
