local Packages = script.Parent.Parent.Parent

local constructor = require(script.Parent.constructor)

local PubTypes = require(script.Parent.Parent.PubTypes)

return function(className: string)
    return function (props: PubTypes.PropertyTable): Instance
        return constructor("Factory", className, {
        }, {}) (props)
    end
end

