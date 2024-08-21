-- Made by legitimate0x1!

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local GUI_Path = CoreGui and CoreGui:FindFirstChild("RobloxGui") or CoreGui

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Line = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
local ImageLabel_3 = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local ObjectList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

local DragToggle = nil
local DragSpeed = 0.25
local DragStart = nil
local StartPosition = nil

ScreenGui.DisplayOrder = 2147483647
ScreenGui.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
Main.Position = UDim2.new(0, 276, 0, 144)
Main.Size = UDim2.new(0, 233, 0, 206)

Line.Name = "Line"
Line.Parent = Main
Line.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line.BorderColor3 = Color3.fromRGB(27, 42, 53)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(-5.63199956e-06, 0, 0.130855381, 0)
Line.Size = UDim2.new(0, 233, 0, 1)

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(27, 42, 53)
Credits.Position = UDim2.new(0.548998654, 0, 0.902055919, 1)
Credits.Size = UDim2.new(0, 110, 0, 19)
Credits.Font = Enum.Font.Gotham
Credits.Text = "⁥b⁥y⁥ ⁥l⁥e⁥g⁥i⁥t⁥i⁥m⁥a⁥t⁥e⁥0⁥x⁥1⁥"
Credits.TextColor3 = Color3.fromRGB(200, 200, 200)
Credits.TextSize = 13.000
Credits.TextWrapped = true
Credits.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel.Parent = Main
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 6)
ImageLabel.Size = UDim2.new(1, 10, 1, 10)
ImageLabel.ZIndex = 0
ImageLabel.Image = "rbxassetid://1316045217"
ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.ImageTransparency = 0.860
ImageLabel.ScaleType = Enum.ScaleType.Slice
ImageLabel.SliceCenter = Rect.new(10, 10, 118, 118)

ImageLabel_2.Parent = Main
ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel_2.Position = UDim2.new(0.5, 0, 0.5, 1)
ImageLabel_2.Size = UDim2.new(1, 18, 1, 18)
ImageLabel_2.ZIndex = 0
ImageLabel_2.Image = "rbxassetid://1316045217"
ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.ImageTransparency = 0.880
ImageLabel_2.ScaleType = Enum.ScaleType.Slice
ImageLabel_2.SliceCenter = Rect.new(10, 10, 118, 118)

ImageLabel_3.Parent = Main
ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_3.BackgroundTransparency = 1.000
ImageLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel_3.Position = UDim2.new(0.5, 0, 0.5, 3)
ImageLabel_3.Size = UDim2.new(1, 5, 1, 5)
ImageLabel_3.ZIndex = 0
ImageLabel_3.Image = "rbxassetid://1316045217"
ImageLabel_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.ImageTransparency = 0.800
ImageLabel_3.ScaleType = Enum.ScaleType.Slice
ImageLabel_3.SliceCenter = Rect.new(10, 10, 118, 118)

Title.Name = "Legitimates"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title.Position = UDim2.new(0.0270350855, 0, -0.00670873793, 1)
Title.Size = UDim2.new(0, 97, 0, 28)
Title.Font = Enum.Font.GothamMedium
Title.Text = "Exploit"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

ObjectList.Name = "Buttons"
ObjectList.Parent = Main
ObjectList.Active = true
ObjectList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ObjectList.BackgroundTransparency = 1.000
ObjectList.BorderColor3 = Color3.fromRGB(0, 0, 0)
ObjectList.BorderSizePixel = 0
ObjectList.Position = UDim2.new(0.0489999987, 0, 0.194000006, 0)
ObjectList.Size = UDim2.new(0, 209, 0, 137)
ObjectList.ScrollBarThickness = 2
ObjectList.CanvasSize = UDim2.new(0, 0, 900, 0)

UIListLayout.Parent = ObjectList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

local UpdateInput = function(Input)
	local Delta = Input.Position - DragStart
	local Pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
	TweenService:Create(Main, TweenInfo.new(DragSpeed), {Position = Pos}):Play()
end

Main.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
		DragToggle = true
		DragStart = Input.Position
		StartPosition = Main.Position
		Input.Changed:Connect(function()
			if Input.UserInputState == Enum.UserInputState.End then
				DragToggle = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
		if DragToggle then
			UpdateInput(Input)
		end
	end
end)

local GUI_Functions = {}

GUI_Functions.ChangeTitle = function(Text)
	Title.Text = Text
end

GUI_Functions.ModifyDragifySpeed = function(Speed)
	DragSpeed = Speed or 0.25
end

GUI_Functions.AddButton = function(Text, Name, LayoutOrder, Function)
	local Object = Instance.new("TextButton")
	Object.Parent = ObjectList
	Object.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	Object.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Object.BorderSizePixel = 0
	Object.LayoutOrder = LayoutOrder
	Object.Position = UDim2.new(0, 0, 0.408759117, 0)
	Object.Size = UDim2.new(0, 208, 0, 23)
	Object.AutoButtonColor = false
	Object.Font = Enum.Font.Gotham
	Object.Text = Text
	Object.TextColor3 = Color3.fromRGB(209, 209, 209)
	Object.TextSize = 14.000

	if Object:IsA("TextButton") or Object:IsA("ImageButton") then
		Object.MouseButton1Click:Connect(function()
			Function()
		end)
	end
end

GUI_Functions.AddTextBox = function(Text, Name, LayoutOrder, PlaceholderText, AutoClear, Function)
	local Object = Instance.new("TextBox")
	Object.Parent = ObjectList
	Object.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	Object.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Object.BorderSizePixel = 0
	Object.LayoutOrder = LayoutOrder
	Object.Position = UDim2.new(0, 0, 0.408759117, 0)
	Object.Size = UDim2.new(0, 208, 0, 23)
	Object.Font = Enum.Font.Gotham
	Object.Text = Text
	Object.TextColor3 = Color3.fromRGB(209, 209, 209)
	Object.TextSize = 14.000
	
	if PlaceholderText ~= nil and PlaceholderText ~= "" then
		Object.PlaceholderText = PlaceholderText
	end

	if AutoClear then
		Object.ClearTextOnFocus = true
	else
		Object.ClearTextOnFocus = false
	end
	
	Object.FocusLost:Connect(function()
		Function(Object.Text)
	end)
end

GUI_Functions.Load = function()
	ScreenGui.Parent = GUI_Path
	loadstring("https://raw.githubusercontent.com/legitimate-0x1/__0x1/main/Libraries/SmoothScroll.lua")()(ObjectList)
end

GUI_Functions.Unload = function(Destroy)
	ScreenGui.Parent = nil
	
	if Destroy then
		ScreenGui:Destroy()
	end
end

return GUI_Functions
