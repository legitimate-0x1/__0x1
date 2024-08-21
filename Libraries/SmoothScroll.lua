local RunService = game:GetService('RunService')

return function (ScrollFrame, Factor)
	Factor = Factor or 0.15
	ScrollFrame.ScrollingEnabled = false
	
	local Emulator = ScrollFrame:Clone()
	Emulator:ClearAllChildren()
	Emulator.BackgroundTransparency = 1
	Emulator.ScrollBarImageTransparency = 1
	Emulator.ZIndex = ScrollFrame.ZIndex + 1
	Emulator.Name = 'ScrollEmulator'
	Emulator.ScrollingEnabled = true
	Emulator.Parent = ScrollFrame.Parent
	
	local function SyncProperty(Property)
		ScrollFrame:GetPropertyChangedSignal(Property):Connect(function()
			if Property == 'ZIndex' then
				Emulator[Property] = ScrollFrame[Property + 1]
			else
				Emulator[Property] = ScrollFrame[Property]
			end
		end)
	end
	
	local Properties = {'CanvasSize', 'Position', 'Rotation', 'ScrollingDirection', 'ScrollBarThickness', 'BorderSizePixel', 'ElasticBehavior', 'SizeConstraint', 'ZIndex', 'BorderColor3', 'Size', 'AnchorPoint', 'Visible'}
	for Index = 1, #Properties do
		SyncProperty(Properties[Index])
	end
	
	
	local SmoothConnection = RunService.RenderStepped:Connect(function()
		local Canvas = ScrollFrame.CanvasPosition
		local FakeCanvas = Emulator.CanvasPosition
		local Math = (FakeCanvas - Canvas) * Factor + Canvas
		
		ScrollFrame.CanvasPosition = Math 
	end)
		
	ScrollFrame.AncestryChanged:Connect(function()
		if ScrollFrame.Parent == nil then
			Emulator:Destroy()
			SmoothConnection:Disconnect()
		end
	end)
end
