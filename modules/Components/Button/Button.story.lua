local Button = require(game.ReplicatedStorage.Packages.Construct.Components.Button)

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
