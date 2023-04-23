local Fusion = require(game.ReplicatedStorage.Packages.Fusion)

local PodKit = game.ReplicatedStorage.Packages.PodKit

local Core = require(PodKit.Core)
local Components = require(PodKit.Components)

local Provider = Core.PodKitProvider
local Children = Core.Fusion.Children

local Cool = Core.Cool

local HStack = Components.HStack
local VStack = Components.VStack
local Box = Components.Box
local Text = Components.Text
local Button = Components.Button
local IconButton = Components.IconButton

local New = Fusion.New

local extendTheme = Core.extendTheme

extendTheme({
	Primary = Color3.fromRGB(255, 255, 255),
	Secondary = Color3.fromRGB(0, 0, 0),
	Bg = Color3.fromRGB(0, 0, 0),
	Destino = Color3.fromHex("EE9D00"),
})

local function App()
	return Provider({
		Id = "App",
		[Children] = {
			VStack({
				BackgroundTransparency = 1,
				PreSize = "full",
				[Children] = {
					HStack({
						PrePosition = "center",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 0.5),
						[Children] = {
							HStack({
								Size = UDim2.fromScale(0.5, 1),
								BackgroundTransparency = 1,
								[Children] = {
									Button({
										PreSize = "xxl",
										Text = "Hello",
										TextColor = "Primary",
										Bg = "Secondary",
										OnClick = function()
											print("Hello")
										end,
									}),
									IconButton({
										PreSize = "lg",
										Variant = "full",
										Bg = "Destino",
										Icon = "rbxassetid://13065105843",
										OnClick = function()
											print("Destino!")
										end,
									}),
								},
							}),
							HStack({
								Size = UDim2.fromScale(0.5, 1),
								BackgroundTransparency = 1,
								[Children] = {
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
								},
							}),
						},
					}),
					HStack({
						PrePosition = "center",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 0.5),
						[Children] = {
							HStack({
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(0.5, 1),
								[Children] = {
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
								},
							}),
							VStack({
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(0.5, 1),
								[Children] = {
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
								},
							}),
						},
					}),
				},
			}),
		},
	})
end

App()
