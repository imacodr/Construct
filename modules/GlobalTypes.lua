local Packages = script.Parent.Parent
local Fusion = require(Packages.Fusion)

local PubTypes = script.Parent.PubTypes

type Children = PubTypes.Children

local DefaultThemes = {
	["white"] = {
		[100] = "#FFFFFF",
		[200] = "#F2F2F2",
		[300] = "#E5E5E5",
		[400] = "#D8D8D8",
		[500] = "#CCCCCC",
		[600] = "#BFBFBF",
		[700] = "#B2B2B2",
		[800] = "#A5A5A5",
		[900] = "#999999",
	},
}

export type Theme = {}

export type KitProviderProps = {
	Id: string,
	_override: {
		ResetOnSpawn: boolean?,
		ZIndexBehavior: Enum.ZIndexBehavior?,
		IgnoreGuiInset: boolean?,
	}?,
	[Children]: Child,
}

export type ThemeProps = {
	colors: {},
}

export type ThemedProp = string | Color3Value | Font


export type CanBeState<T> = T | Fusion.State<T>

export type BaseComponents = {
	Name: CanBeState<string>?,
	LayoutOrder: CanBeState<number>?,
	Position: CanBeState<UDim2>?,
	AnchorPoint: CanBeState<Vector2>?,
	Size: CanBeState<UDim2>?,
	AutomaticSize: CanBeState<Enum.AutomaticSize>?,
	ZIndex: CanBeState<number>?,
	PreSize: "xsm" | "xm" | "sm" | "md" | "xl" | "lg" | "xxl"?,
	PrePosition: "topLeft"
		| "topRight"
		| "bottomLeft"
		| "bottomRight"
		| "center"
		| "bottomCenter"
		| "topCenter"
		| "left"
		| "right"?,
}

export type BoxProps = BaseComponents & {
	BackgroundTransparency: CanBeState<number>?,
	BackgroundColor: CanBeState<string | Color3Value>?,
	Bg: CanBeState<string | Color3Value>?,
}

export type DockProps = BaseComponents & {
	Position: UDim2,
	Size: UDim2,
	Padding: ({ [number]: number } | number)?,
	Bg: string | Color3Value?,
}

export type ButtonProps = BaseComponents & {
	Padding: ({ [number]: number } | number)?,
	Bg: string | Color3Value?,
	BackgroundColor: string | Color3Value?,
	TextColor: string | Color3Value?,
	Disabled: boolean | Value<boolean>?,
	OnClick: () -> any?,
	OnHoverStart: () -> any?,
	OnHoverEnd: () -> any?,
	Text: string,
	[Children]: Child,
}
export type TextProps = BaseComponents & {
	Padding: ({ [number]: number } | number)?,
	Bg: string | Color3Value?,
	BackgroundColor: string | Color3Value?,
	TextColor: string | Color3Value?,
	OnHoverStart: () -> any?,
	OnHoverEnd: () -> any?,
	Text: string,
	[Children]: Child,
}

export type IconButtonProps = BaseComponents & {
	Padding: ({ [number]: number } | number)?,
	Bg: string | Color3Value?,
	BackgroundColor: string | Color3Value?,
	Disabled: boolean | Value<boolean>?,
	OnClick: () -> any?,
	OnHoverStart: () -> any?,
	OnHoverEnd: () -> any?,
	Icon: string | ImageLabel?,
	Variant: "full" | "ghost"?,
	IconColor: string | Color3Value?,
	[Children]: Child,
}

export type StackProps = BoxProps & {
	Direction: Enum.FillDirection?,
	Spacing: UDim?,
	[Children]: Child,
}


return {}
