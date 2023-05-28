local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local Value = Fusion.Value

local Basics = require(script.Parent.Parent.Utils.Basics)

local Types = script.Parent.Parent.Types

_G.CONSTRUCT_THEME = Basics

function extendTheme(theme)
	local newTheme = {}

	-- Merge the provided theme with _G.CONSTRUCT_THEME
	for key, value in pairs(_G.CONSTRUCT_THEME) do
		newTheme[key] = value
	end

	-- Helper function to merge nested tables
	local function mergeTables(destination, source)
		for key, value in pairs(source) do
			if type(value) == "table" then
				-- If the value is a table, recursively merge it
				destination[key] = destination[key] or {}
				mergeTables(destination[key], value)
			else
				destination[key] = value
			end
		end
	end

	-- Merge the provided theme with the existing theme, handling nested tables
	mergeTables(newTheme, theme)

	_G.CONSTRUCT_THEME = newTheme
end

function checkTheme(value: string)
	if typeof(value) ~= "string" then
		return value
	end

	local themeValue = _G.CONSTRUCT_THEME -- Start with the root theme table

	-- Split the value by periods to handle nested values
	local keys = string.split(value, ".")

	-- Traverse the nested keys to access the desired theme value
	for _, key in ipairs(keys) do
		themeValue = themeValue[key]
		if not themeValue then
			return nil -- Return nil if any key is not found
		end
	end

	return themeValue
end

return { checkTheme = checkTheme, extendTheme = extendTheme }
