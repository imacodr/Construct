local Button = require(script.Parent.Parent.Button)

return {
	summary = "A button component",
	controls = {
		Disabled = false,
	},
	story = function(parent, props)
		return Button({
			Parent = parent,
			PreSize = "md",
			PrePosition = "topLeft",
			Text = "Hello World!",
			Disabled = props.controls.Disabled,
		})
	end,
}
