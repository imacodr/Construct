local PubTypes = require(script.Parent.Parent.PubTypes)

return function(componentName: string)

    local Component = require(script.Parent[componentName])

    return function (props: PubTypes.PropertyTable): Instance
        return Component(props)
    end
end