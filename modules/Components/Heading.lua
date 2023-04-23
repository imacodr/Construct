local Types = script.Parent.Parent.Types

local Text = require(script.Parent.Text)

function Heading(props: Types.TextProps): Child
	local text = props.Text

	props.Text = nil
	return Text({
		Text = "<b>" .. text .. "</b>",
		props,
	})
end

return Heading
