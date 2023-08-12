-- TODO: Toast component

local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")

local Packages = script.Parent.Parent.Parent
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Tween = Fusion.Tween
local Computed = Fusion.Computed
local Ref = Fusion.Ref

local Box = require(script.Parent.Box)
local HStack = require(script.Parent.Stack).Stack
local VStack = require(script.Parent.Stack).VStack
local Text = require(script.Parent.Text)
local Icon = require(script.Parent.Icon)
local IconButton = require(script.Parent.IconButton)

local GlobalTypes = script.Parent.Parent.GlobalTypes

local Utils = require(script.Parent.Parent.Utils)
local Basics = Utils.Basics
local Logger = Utils.loggers

local checkTheme = require(script.Parent.Parent.Core.ThemeManager)
local FactoryNew = require(script.Parent.Parent.Core).New

--[[
	Toast is still a work in progress. It is not yet implemented in the library.
--]]

local toastPosition = {
	topLeft = {
		horizontalAlignment = Enum.HorizontalAlignment.Left,
		verticalAlignment = Enum.VerticalAlignment.Top,
	},
	topRight = {
		horizontalAlignment = Enum.HorizontalAlignment.Right,
		verticalAlignment = Enum.VerticalAlignment.Top,
	},
	topCenter = {
		horizontalAlignment = Enum.HorizontalAlignment.Center,
		verticalAlignment = Enum.VerticalAlignment.Top,
	},
	bottomLeft = {
		horizontalAlignment = Enum.HorizontalAlignment.Left,
		verticalAlignment = Enum.VerticalAlignment.Bottom,
	},
	bottomRight = {
		horizontalAlignment = Enum.HorizontalAlignment.Right,
		verticalAlignment = Enum.VerticalAlignment.Bottom,
	},
	bottomCenter = {
		horizontalAlignment = Enum.HorizontalAlignment.Center,
		verticalAlignment = Enum.VerticalAlignment.Bottom,
	},
}

type ToastBaseProps = {
	_frameProps: {
		[any]: any
	},
	_textProps: {
		[any]: any
	},
	_iconProps: {
		[any]: any
	},
}

type ToastProps = ToastBaseProps & {
	Id: string,
	Ready: boolean,
	Title: string,
	Icon: string?,
}

type useToastProps = ToastBaseProps & {
	variant: "success" | "error" | "warning" | "info",
	title: string,
	icon: string?,
	provider: Instance?,
	position: string?,
	duration: number?,
	backgroundColor: Color3Value?,
}

function Toast(props: ToastProps): Instance
	return Box {
		As = "CanvasGroup",
		Name = props.Id,
		Position = Tween(Computed(function()
			if props.Ready:get() then
				return UDim2.new(0.5, 0, 0.9, 0)
			else
				return UDim2.new(0.5, 0, 0.95, 0)
			end
		end), TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.15, 0, 0.06, 0),
		Bg = props.Bg,
		GroupTransparency = Tween(Computed(function()
			if props.Ready:get() then
				return 0
			else
				return 1
			end
		end), TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)),
		CornerRadius = UDim.new(0.2, 0),
		PaddingY = UDim.new(0.05, 0),
		props._frameProps,

		[Children] = {
			Icon {
				PrePosition = "left",
				Icon = props.Icon or "rbxassetid://10709790387",
				Size = UDim2.new(0,80, 0.8,0),
				props._iconProps,
			},
			Text {
				PrePosition = "right",
				Size = UDim2.fromScale(0.75, 0.7),
				TextColor = "Cool.White",
				Text = props.Title or "Hello",
				props._textProps,
			}
		}
	}
end

function useToast(props: useToastProps)
	local ready = Value(false)

	local parent, toastId

	local position
	local positionName

	if props.position then
		position = toastPosition[props.position]
		positionName = props.position
	else
		position = toastPosition.bottomRight
		positionName = "bottomRight"
	end

	if props.provider then
		parent = props.provider:WaitForChild("ConstructPortal")
	else
		parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("ConstructBuilder"):WaitForChild("ConstructPortal")
	end

	local ok,result = pcall(HttpService.GenerateGUID, HttpService, false)
	if ok then
		toastId = result
	else
		Logger.logWarning("toastUUIDCatch", result)
		toastId = math.random(1,1000000000)
	end

	local toast = Toast {
		Id = "Toast_" .. toastId,
		Ready = ready,
		Icon = props.icon,
		Title = props.title,
		Bg = props.backgroundColor or Basics.Toast.Bg,
		_frameProps = props._frameProps,
		_textProps = props._textProps,
		_iconProps = props._iconProps,
	}

	local haven = parent:FindFirstChild("haven_" .. positionName)

	if haven then
		toast.Parent = haven
	else
		haven = FactoryNew("Frame")({
			Name = "haven_" .. positionName,
			PrePosition = "center",
			Parent = parent,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0.99, 0.945),
			ZIndex = 99,
	
			[Children] = {
				toast,
				New "UIListLayout" {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = position.horizontalAlignment,
					VerticalAlignment = position.verticalAlignment,
					Padding = UDim.new(0.01, 0),
				},
			}
		})
	end

	ready:set(true)
	
	local duration

	if props.duration then
		duration = props.duration
	else
		duration = 5
	end

	task.delay(duration, function()
		ready:set(false)
		task.delay(0.4, function()
			toast:Destroy()

			if #haven:GetChildren() == 1 then
				haven:Destroy()
			end
		end)
	end)
end

return useToast
