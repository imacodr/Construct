--[[
    Construct - The ultimate component library for Fusion with next level theming capabilities.
        ~Import - A module that can be used to import components from the Construct library.
    
    This file is the entry point for the Construct Import module.
--]]

local function import(componentPath)
    local prefix = "@"
    local separator = "/"
    local componentName = componentPath:split(prefix)[2] -- Extract the component name after "@"
    local moduleNames = {"Components", "Core", "Utils"}
    local module = nil

    for _, moduleName in ipairs(moduleNames) do
        local moduleNameWithPrefix = prefix .. moduleName
        if componentPath:sub(1, #moduleNameWithPrefix) == moduleNameWithPrefix then
            module = game:GetService("ReplicatedStorage"):FindFirstChild(moduleName)
            componentPath = componentPath:sub(#moduleNameWithPrefix + #separator + 1)
            break
        end
    end

    if not module then
        error("Invalid component path: " .. componentPath, 2)
    end

    local paths = componentPath:split(separator) -- Split the remaining path with "/"
    for _, path in ipairs(paths) do
        module = module:FindFirstChild(path)
        if not module then
            error("Component not found: " .. componentPath, 2)
        end
    end

    local component = module:FindFirstChild(componentName)
    if not component then
        error("Component not found: " .. componentPath, 2)
    end

    return require(component)
end

return import
