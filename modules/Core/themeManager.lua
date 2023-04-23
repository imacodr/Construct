local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Value = Fusion.Value

local Basics = require(script.Parent.Parent.Utils.Basics)

local Types = script.Parent.Parent.Types

_G.PODKIT_THEME = Basics

function extendTheme(theme: Types.ThemeProps)
	local newTheme = {}

	-- Mege the provided theme with _G.PODKIT_THEME
	for key, value in pairs(_G.PODKIT_THEME) do
		newTheme[key] = value
	end

	for key, value in pairs(theme) do
		newTheme[key] = value
	end

	_G.PODKIT_THEME = newTheme
end

-- TODO: Add support for nested theme values
-- e.g. "Button.Bg" -> _G.PODKIT_THEME.Button.Bg

function checkTheme(value: string)
	if typeof(value) ~= "string" then
		return value
	end

	if _G.PODKIT_THEME[value] then
		return _G.PODKIT_THEME[value]
	else
		return nil
	end

	return value
end

return { checkTheme = checkTheme, extendTheme = extendTheme }
