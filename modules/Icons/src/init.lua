--[[
    Construct - The ultimate component library for Fusion with next level theming capabilities.
        ~DestructCons - A collection of icons that can be used to build a UI.
    
    This file is the entry point for the Construct Icons module.
--]]

local Lucide = require(script.LucideIcons)

-- !!! Experimental
function fromLucide(iconName: string ): string
    if Lucide[iconName] then
        return Lucide[iconName]
    else
        error("Icon not found in Lucide Icons")
    end
    
end

local DestructCons = {
	Lucide = require(script.LucideIcons),
    fromLucide = fromLucide,
}

return DestructCons
