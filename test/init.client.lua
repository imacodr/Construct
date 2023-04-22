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
local Button = Components.Button
local IconButton = Components.IconButton

local New = Fusion.New

local extendTheme = Core.extendTheme

extendTheme({
	Primary = Color3.fromRGB(255, 255, 255),
	Secondary = Color3.fromRGB(0, 0, 0),
})

local function App()
	return Provider({
		Id = "App",
		[Children] = {
			VStack({
				PreSize = "full",
				[Children] = {
					HStack({
						PrePosition = "center",
						Size = UDim2.fromScale(1, 0.5),
						[Children] = {
							HStack({
								Size = UDim2.fromScale(0.5, 1),
								[Children] = {
									Button({
										PreSize = "xxl",
										Text = "Hello",
										OnClick = function()
											print("Hello")
										end,
									}),
									IconButton({
										PreSize = "lg",
										Variant = "full",
										Icon = "rbxassetid://13065105843",
										OnClick = function()
											print("Hello")
										end,
									}),
								},
							}),
							HStack({
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
					HStack({
						PrePosition = "center",
						Size = UDim2.fromScale(1, 0.5),
						[Children] = {
							HStack({
								Size = UDim2.fromScale(0.5, 1),
								[Children] = {
									Button({
										PreSize = "xxl",
										Text = "Hello",
										TextColor = "App.blue",
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
