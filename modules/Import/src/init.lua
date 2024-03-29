--[[
    Construct - The ultimate component library for Fusion with next level theming capabilities.
        ~Bridge - A module that can be used to import components from the Construct library.
    
    This file is the entry point for the Construct Bridge module.
--]]

local function import(modulePath)
    local root = script.Parent

    local path = modulePath:gsub("@", root.Name)
    local moduleParts = string.split(path, "/")
    local currentModule = root

    for _, part in ipairs(moduleParts) do
        currentModule = currentModule:FindFirstChild(part)
        if not currentModule then
            error("Module not found: " .. modulePath)
        end
    end

    return require(currentModule)
end

return import
