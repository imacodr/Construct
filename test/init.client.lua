local Fusion = require(game.ReplicatedStorage.Packages.Fusion)

local PodKit = game.ReplicatedStorage.Packages.PodKit

local Core = require(PodKit.Core)
local Components = require(PodKit.Components)
local podicons = require(PodKit.podicons)

local Provider = Core.PodKitProvider
local Children = Core.Fusion.Children

local Cool = Core.Cool

local HStack = Components.HStack
local VStack = Components.VStack
local Box = Components.Box
local Text = Components.Text
local Toast = Components.Toast
local Heading = Components.Heading
local Button = Components.Button
local IconButton = Components.IconButton

local New = Fusion.New
local Value = Fusion.Value
local Computed = Fusion.Computed

local extendTheme = Core.extendTheme

extendTheme({
	Primary = Color3.fromRGB(255, 255, 255),
	Secondary = Color3.fromRGB(0, 0, 0),
	Bg = Color3.fromHex("0D0C1D"),
	IconBg = Color3.fromHex("12172B"),
	Destino = Color3.fromHex("EE9D00"),
})

local function App()
	New("ScreenGui")({
		Name = "PodKitToast",
		Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"),
		[Children] = {
			Toast({}),
		},
	})

	local Range = Value(0)

	return Provider({
		Id = "App",
		[Children] = {
			Box({
				PrePosition = "bottomLeft",
				PreSize = "xl",
				Bg = "Bg",
				[Children] = {
					Text({
						Position = UDim2.fromScale(0.03, 0.03),
						AnchorPoint = "topLeft",
						PreSize = "xxl",
						Text = "Range",
						TextColor = "Primary",
						Font = Font.fromEnum(Enum.Font.Arial),
					}),
					HStack({
						Size = UDim2.fromScale(0.95, 0.65),
						Position = UDim2.fromScale(0.03, 0.3),
						BackgroundTransparency = 1,
						PrePosition = "topLeft",
						Spacing = UDim.new(0.01, 0),
						[Children] = {
							IconButton({
								Icon = podicons.Lucide.plus,
								Bg = "IconBg",
								OnClick = function()
									Range:set(Range:get() + 1)
								end,
								IconColor = Color3.fromRGB(255, 255, 255),
								PrePosition = "topLeft",
								Size = UDim2.fromScale(0.6, 0.6),
							}),
							Text({
								Size = UDim2.fromScale(0.6, 0.6),
								Text = Computed(function()
									return "Current Range: " .. Range:get()
								end),
								TextColor = "Primary",
								Font = Font.fromEnum(Enum.Font.Arial),
							}),
							IconButton({
								Name = "Remove",
								Icon = podicons.Lucide.minus,
								Bg = "IconBg",
								OnClick = function()
									if Range:get() > 0 then
										Range:set(Range:get() - 1)
									end
								end,
								IconColor = Color3.fromRGB(255, 255, 255),
								PrePosition = "topLeft",
								Size = UDim2.fromScale(0.6, 0.6),
							}),
						},
					}),
				},
			}),
		},
	})
end

App()
