local Fusion = require(game.ReplicatedStorage.Packages.Fusion)

local Construct = game.ReplicatedStorage.Packages.Construct

local Core = require(Construct.Core)
local Components = require(Construct.Components)
local DestructCons = require(Construct.destructcons)

local Provider = Core.Provider
local Children = Fusion.Children

local Cool = Core.Cool

local HStack = Components.HStack
local VStack = Components.VStack
local Box = Components.Box
local Text = Components.Text
local Toast = Components.Toast
local Heading = Components.Heading
local Button = Components.Button
local IconButton = Components.IconButton
local Icon = Components.Icon

local New = Fusion.New
local Value = Fusion.Value
local Computed = Fusion.Computed

local extendTheme = Core.extendTheme

extendTheme({
	Primary = Color3.fromRGB(255, 255, 255),
	Secondary = Color3.fromRGB(0, 0, 0),
	Text = Color3.fromHex("#0085FF"),
	Bg = Color3.fromHex("0D0C1D"),
	IconBg = Color3.fromHex("12172B"),
	Destino = Color3.fromHex("EE9D00"),
	Cool = {
		Red = Color3.fromHex("#FF0000"),
		Blue = Color3.fromHex("#0000FF"),
		Green = Color3.fromHex("#00FF00"),
		Orange = Color3.fromHex("#FFA500"),
		White = Color3.fromHex("#FFFFFF"),
		Black = Color3.fromHex("#000000"),
	},
	Test = {
		Cool = Color3.fromHex("#EE9D00"),
	},
	Button = {
		Bg = Color3.fromHex("12172B"),
	},
})

-- local RangeGui = Box({
-- 	PrePosition = "bottomLeft",
-- 	PreSize = "xl",
-- 	Bg = "Bg",
-- 	[Children] = {
-- 		Text({
-- 			Position = UDim2.fromScale(0.03, 0.03),
-- 			AnchorPoint = "topLeft",
-- 			PreSize = "xxl",
-- 			Text = "Range",
-- 			TextColor = "Primary",
-- 			Font = Font.fromEnum(Enum.Font.Arial),
-- 		}),
-- 		HStack({
-- 			Size = UDim2.fromScale(0.95, 0.65),
-- 			Position = UDim2.fromScale(0.03, 0.3),
-- 			BackgroundTransparency = 1,
-- 			PrePosition = "topLeft",
-- 			Spacing = UDim.new(0.01, 0),
-- 			[Children] = {
-- 				IconButton({
-- 					Icon = podicons.Lucide.plus,
-- 					Bg = "IconBg",
-- 					OnClick = function()
-- 						Range:set(Range:get() + 1)
-- 					end,
-- 					IconColor = Color3.fromRGB(255, 255, 255),
-- 					PrePosition = "topLeft",
-- 					Size = UDim2.fromScale(0.6, 0.6),
-- 				}),
-- 				Text({
-- 					Size = UDim2.fromScale(0.6, 0.6),
-- 					Text = Computed(function()
-- 						return "Current Range: " .. Range:get()
-- 					end),
-- 					TextColor = "Primary",
-- 					Font = Font.fromEnum(Enum.Font.Arial),
-- 				}),
-- 				IconButton({
-- 					Name = "Remove",
-- 					Icon = podicons.Lucide.minus,
-- 					Bg = "IconBg",
-- 					OnClick = function()
-- 						if Range:get() > 0 then
-- 							Range:set(Range:get() - 1)
-- 						end
-- 					end,
-- 					IconColor = Color3.fromRGB(255, 255, 255),
-- 					PrePosition = "topLeft",
-- 					Size = UDim2.fromScale(0.6, 0.6),
-- 				}),
-- 			},
-- 		}),
-- 	},
-- })

local function App()
	local Range = Value(0)

	return Provider({
		Id = "App",
		GuiType = "SurfaceGui",
		Parent = workspace.Machine.System.Screen,
		Face = "Left",
		PixelsPerStud = 500,
		[Children] = {
			Box({
				BackgroundColor = "Primary",
				PreSize = "full",
				[Children] = {
					HStack({
						PrePosition = "topLeft",
						Size = UDim2.fromScale(0.4, 0.07),
						VerticalAlignment = Enum.VerticalAlignment.Center,
						[Children] = {
							Icon({
								Name = "Clock",
								Icon = DestructCons.Lucide.clock4,
								Color = "Cool.Black",
								Size = UDim2.fromScale(0.2, 0.5),
								PrePosition = "topLeft",
							}),
							Text({
								PrePosition = "topLeft",
								Size = UDim2.fromScale(0.6, 0.4),
								Text = "1:30 PM",
								TextColor = "Cool.Black",
								Font = Font.fromName("Inter", Enum.FontWeight.SemiBold),
							}),
						},
					}),
					HStack({
						PrePosition = "topCenter",
						Size = UDim2.fromScale(0.3, 0.07),
						VerticalAlignment = Enum.VerticalAlignment.Center,
						[Children] = {
							Icon({
								Icon = "rbxassetid://12603812143",
								Color = "Cool.Black",
								Size = UDim2.fromScale(0.3, 0.6),
								PrePosition = "topCenter",
							}),
						},
					}),
					HStack({
						PrePosition = "topRight",
						Size = UDim2.fromScale(0.4, 0.07),
						VerticalAlignment = Enum.VerticalAlignment.Center,
						[Children] = {
							Text({
								Name = "1",
								PrePosition = "topRight",
								Size = UDim2.fromScale(0.6, 0.4),
								Text = "5/28/2023",
								TextColor = "Cool.Black",
								TextXAlignment = Enum.TextXAlignment.Right,
								Font = Font.fromName("Inter", Enum.FontWeight.SemiBold),
							}),
							Icon({
								Name = "2",
								Icon = DestructCons.Lucide.calendar,
								Color = "Cool.Black",
								Size = UDim2.fromScale(0.2, 0.5),
								PrePosition = "topRight",
							}),
						},
					}),
					Box({
						PrePosition = "center",
						PreSize = "xl",
						BackgroundColor = "Cool.Black",
						[Children] = {
							Text({
								PrePosition = "center",
								Size = UDim2.fromScale(0.8, 0.8),
								Text = "Hello, World!",
								TextColor = "Cool.White",
								Font = Font.fromName("Inter", Enum.FontWeight.SemiBold),
							}),
						},
					}),
					Button({
						PrePosition = "bottomCenter",
						PreSize = "xl",
						Text = "Click me!",
						OnClick = function()
							print("Clicked!")
						end,
					}),
				},
			}),
		},
	})
end

App()
