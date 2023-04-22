local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children

local Types = script.Parent.Parent.Types

function extendTheme(theme: Types.ThemeProps)
	print(theme)
	_G.PODKIT_THEME = theme
end

return extendTheme
