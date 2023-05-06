-- TODO: Toast component

local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Spring = Fusion.Spring

local Box = require(script.Parent.Box)
local HStack = require(script.Parent.Stack).Stack
local Text = require(script.Parent.Text)
local Icon = require(script.Parent.Icon)
local IconButton = require(script.Parent.IconButton)

local Types = script.Parent.Parent.Types

local Basics = require(script.Parent.Parent.Utils.Basics)
local checkTheme = require(script.Parent.Parent.Core.ThemeManager).checkTheme

function Toast(props: Types.ToastProps): Child
	return Box({
		Name = props.Id or "Toast",
		Position = UDim2.fromScale(0.5, 0.95),
		AnchorPoint = Vector2.new(0.5, 1),
		-- Bg = Color3.fromHex("#90cdf4"),
		Bg = "Destino",
		Size = UDim2.fromScale(0.16, 0.05),
		[Children] = {
			New("UICorner")({
				CornerRadius = UDim.new(0.2, 0),
			}),
			HStack({
				PreSize = "full",
				BackgroundTransparency = 1,
				[Children] = {
					Icon({
						Icon = "rbxassetid://12970546311",
						IconColor = Color3.fromHex("#000000"),
						Size = UDim2.fromScale(0.15, 0.8),
					}),
					Text({
						Size = UDim2.fromScale(0.8, 0.8),
						Text = "Card Added to Dock",
						Font = Font.fromName("SourceSansBold"),
						TextColor = Color3.fromHex("#000000"),
						PrePosition = "center",
					}),
				},
			}),
			IconButton({
				Icon = "rbxassetid://12324498733",
				IconColor = Color3.fromHex("#000000"),
				Size = UDim2.fromScale(0.7, 0.5),
				Position = UDim2.fromScale(1.03, -0.13),
				AnchorPoint = Vector2.new(1, 0),
				Bg = Color3.fromRGB(255, 0, 0),
				PaddingLeft = UDim.new(0.8, 0),
			}),
		},
	})
end

function useToast() end

return Toast
