local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")


---

-- GUI

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,260,0,370)
Main.Position = UDim2.new(0.5,-130,0.5,-185)
Main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Main.BorderSizePixel = 0

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = Main
MainStroke.Thickness = 2

local Gradient = Instance.new("UIGradient")
Gradient.Parent = Main
Gradient.Color = ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(25,25,25)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,10))
}

task.spawn(function()
while true do
MainStroke.Color = Color3.fromHSV((tick()%5)/5,1,1)
task.wait(0.03)
end
end)


---

-- TITLE

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,-70,0,50)
Title.Position = UDim2.new(0,12,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Props By | Hanz"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
while true do
Title.TextColor3 = Color3.fromHSV((tick()%5)/5,1,1)
task.wait(0.03)
end
end)


---

-- MINIMIZE

local Minimize = Instance.new("TextButton")
Minimize.Parent = Main
Minimize.Size = UDim2.new(0,30,0,30)
Minimize.Position = UDim2.new(1,-75,0,10)
Minimize.BackgroundColor3 = Color3.fromRGB(0,170,255)
Minimize.Text = "-"
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 20
Minimize.BorderSizePixel = 0

Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1,0)


---

-- CLOSE

local Close = Instance.new("TextButton")
Close.Parent = Main
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-40,0,10)
Close.BackgroundColor3 = Color3.fromRGB(255,60,60)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.BorderSizePixel = 0

Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

Close.MouseButton1Click:Connect(function()
ScreenGui:Destroy()
end)


---

-- FLOATING BUBBLE

local Bubble = Instance.new("TextButton")
Bubble.Parent = ScreenGui
Bubble.Size = UDim2.new(0,70,0,70)
Bubble.Position = UDim2.new(0.1,0,0.5,0)
Bubble.BackgroundColor3 = Color3.fromRGB(20,20,20)
Bubble.Text = "Hanz"
Bubble.Font = Enum.Font.GothamBold
Bubble.TextSize = 16
Bubble.Visible = false
Bubble.BorderSizePixel = 0

Instance.new("UICorner", Bubble).CornerRadius = UDim.new(1,0)

local BubbleStroke = Instance.new("UIStroke")
BubbleStroke.Parent = Bubble
BubbleStroke.Thickness = 2

task.spawn(function()
while true do
local rgb = Color3.fromHSV((tick()%5)/5,1,1)
Bubble.TextColor3 = rgb
BubbleStroke.Color = rgb
task.wait(0.03)
end
end)


---

-- MINIMIZE FIX

Minimize.MouseButton1Click:Connect(function()
Main.Visible = false
Bubble.Visible = true
end)

Bubble.MouseButton1Click:Connect(function()
Main.Visible = true
Bubble.Visible = false
end)


---

-- BUTTON CREATOR

local function CreateButton(text,posY,color)

local Button = Instance.new("TextButton")
Button.Parent = Main
Button.Size = UDim2.new(0,220,0,40)
Button.Position = UDim2.new(0.5,-110,0,posY)
Button.BackgroundColor3 = color
Button.Text = text.." : OFF"
Button.TextColor3 = Color3.new(1,1,1)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.BorderSizePixel = 0

Instance.new("UICorner",Button).CornerRadius = UDim.new(0,14)

Button.MouseButton1Down:Connect(function()

TweenService:Create(    
	Button,    
	TweenInfo.new(0.1),    
	{    
		Size = UDim2.new(0,210,0,36)    
	}    
):Play()

end)

Button.MouseButton1Up:Connect(function()

TweenService:Create(    
	Button,    
	TweenInfo.new(0.1),    
	{    
		Size = UDim2.new(0,220,0,40)    
	}    
):Play()

end)

return Button

end


---

-- BUTTONS

local Wings = CreateButton("Wings",60,Color3.fromRGB(0,170,255))
local Orbit = CreateButton("Orbit",110,Color3.fromRGB(0,255,120))
local Tail = CreateButton("Tail",160,Color3.fromRGB(255,170,0))
local Ring = CreateButton("Ring",210,Color3.fromRGB(170,0,255))
local Rainbow = CreateButton("Rainbow",260,Color3.fromRGB(255,0,255))

---------------------------------------------------
-- COLOR CUSTOM BUTTON
---------------------------------------------------

local ColorCustom = Instance.new("TextButton")
ColorCustom.Parent = Main
ColorCustom.Size = UDim2.new(0,220,0,40)
ColorCustom.Position = UDim2.new(0.5,-110,0,310)
ColorCustom.BackgroundColor3 = Color3.fromRGB(0,140,255)
ColorCustom.Text = "Color Custom"
ColorCustom.TextColor3 = Color3.new(1,1,1)
ColorCustom.Font = Enum.Font.GothamBold
ColorCustom.TextSize = 16
ColorCustom.BorderSizePixel = 0

Instance.new("UICorner",ColorCustom).CornerRadius = UDim.new(0,14)

---------------------------------------------------
-- RESET BUTTON DIPINDAH
---------------------------------------------------

local Reset = Instance.new("TextButton")
Reset.Parent = Main
Reset.Size = UDim2.new(0,220,0,40)
Reset.Position = UDim2.new(0.5,-110,0,360)
Reset.BackgroundColor3 = Color3.fromRGB(255,60,60)
Reset.Text = "Reset Props"
Reset.TextColor3 = Color3.new(1,1,1)
Reset.Font = Enum.Font.GothamBold
Reset.TextSize = 16
Reset.BorderSizePixel = 0

Instance.new("UICorner",Reset).CornerRadius = UDim.new(0,14)

---------------------------------------------------
-- RESIZE MAIN
---------------------------------------------------

Main.Size = UDim2.new(0,260,0,430)
Main.Position = UDim2.new(0.5,-130,0.5,-215)

---------------------------------------------------
-- COLOR GUI
---------------------------------------------------

local ColorFrame = Instance.new("Frame")
ColorFrame.Parent = ScreenGui
ColorFrame.Size = UDim2.new(0,260,0,430)
ColorFrame.Position = Main.Position
ColorFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
ColorFrame.Visible = false
ColorFrame.BorderSizePixel = 0

Instance.new("UICorner",ColorFrame).CornerRadius = UDim.new(0,20)

local ColorStroke = Instance.new("UIStroke")
ColorStroke.Parent = ColorFrame
ColorStroke.Thickness = 2

task.spawn(function()
	while true do
		ColorStroke.Color = Color3.fromHSV((tick()%5)/5,1,1)
		task.wait(0.03)
	end
end)

---------------------------------------------------
-- COLOR TITLE
---------------------------------------------------

local ColorTitle = Instance.new("TextLabel")
ColorTitle.Parent = ColorFrame
ColorTitle.Size = UDim2.new(1,0,0,50)
ColorTitle.BackgroundTransparency = 1
ColorTitle.Text = "Choose Color"
ColorTitle.TextColor3 = Color3.new(1,1,1)
ColorTitle.Font = Enum.Font.GothamBold
ColorTitle.TextSize = 20

---------------------------------------------------
-- BACK BUTTON
---------------------------------------------------

local Back = Instance.new("TextButton")
Back.Parent = ColorFrame
Back.Size = UDim2.new(0,220,0,40)
Back.Position = UDim2.new(0.5,-110,1,-55)
Back.BackgroundColor3 = Color3.fromRGB(255,60,60)
Back.Text = "Back"
Back.TextColor3 = Color3.new(1,1,1)
Back.Font = Enum.Font.GothamBold
Back.TextSize = 16
Back.BorderSizePixel = 0

Instance.new("UICorner",Back).CornerRadius = UDim.new(0,14)

---------------------------------------------------
-- OPEN / CLOSE COLOR GUI
---------------------------------------------------

ColorCustom.MouseButton1Click:Connect(function()
	Main.Visible = false
	ColorFrame.Visible = true
end)

Back.MouseButton1Click:Connect(function()
	Main.Visible = true
	ColorFrame.Visible = false
end)

---------------------------------------------------
-- COLOR FUNCTION
---------------------------------------------------

local function ChangeAllPropsColor(color)

	local Folder =
		workspace.WorkspaceCom["001_TrafficCones"]

	for _,prop in ipairs(Folder:GetChildren()) do

		if prop.Name:find("Prop" .. player.Name) then

			local remote =
				prop:FindFirstChild("ChangePropColor")

			if remote then

				pcall(function()
					remote:InvokeServer(color)
				end)
			end
		end
	end
end

---------------------------------------------------
-- CREATE COLOR BUTTON
---------------------------------------------------

local function CreateColorButton(name,color,x,y)

	local Button = Instance.new("TextButton")
	Button.Parent = ColorFrame
	Button.Size = UDim2.new(0,90,0,40)
	Button.Position = UDim2.new(0,x,0,y)
	Button.BackgroundColor3 = color
	Button.Text = name
	Button.TextColor3 = Color3.new(1,1,1)
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 14
	Button.BorderSizePixel = 0

	Instance.new("UICorner",Button).CornerRadius = UDim.new(0,12)

	Button.MouseButton1Click:Connect(function()

		RainbowEnabled = false
		Rainbow.Text = "Rainbow : OFF"
		Rainbow.BackgroundColor3 = Color3.fromRGB(255,0,255)

		ChangeAllPropsColor(color)
	end)
end

---------------------------------------------------
-- COLOR BUTTONS
---------------------------------------------------

CreateColorButton("Red",Color3.fromRGB(255,0,0),20,70)
CreateColorButton("Blue",Color3.fromRGB(0,120,255),140,70)

CreateColorButton("Green",Color3.fromRGB(0,255,100),20,130)
CreateColorButton("Yellow",Color3.fromRGB(255,255,0),140,130)

CreateColorButton("Purple",Color3.fromRGB(170,0,255),20,190)
CreateColorButton("Pink",Color3.fromRGB(255,0,150),140,190)

CreateColorButton("White",Color3.fromRGB(255,255,255),20,250)
CreateColorButton("Black",Color3.fromRGB(0,0,0),140,250)

-- STATUS

local OrbitEnabled = false
local WingsEnabled = false
local TailEnabled = false
local RingEnabled = false
local RainbowEnabled = false


---

-- DISABLE ALL

local function DisableAll()

OrbitEnabled = false
WingsEnabled = false
TailEnabled = false
RingEnabled = false

Orbit.Text = "Orbit : OFF"
Wings.Text = "Wings : OFF"
Tail.Text = "Tail : OFF"
Ring.Text = "Ring : OFF"

Orbit.BackgroundColor3 = Color3.fromRGB(0,255,120)
Wings.BackgroundColor3 = Color3.fromRGB(0,170,255)
Tail.BackgroundColor3 = Color3.fromRGB(255,170,0)
Ring.BackgroundColor3 = Color3.fromRGB(170,0,255)

end


---

-- BUTTON EVENTS

Orbit.MouseButton1Click:Connect(function()

local state = not OrbitEnabled

DisableAll()

OrbitEnabled = state

if OrbitEnabled then
Orbit.Text = "Orbit : ON"
end

end)

Wings.MouseButton1Click:Connect(function()

local state = not WingsEnabled

DisableAll()

WingsEnabled = state

if WingsEnabled then
Wings.Text = "Wings : ON"
Wings.BackgroundColor3 = Color3.fromRGB(0,255,120)
end

end)

Tail.MouseButton1Click:Connect(function()

local state = not TailEnabled

DisableAll()

TailEnabled = state

if TailEnabled then
Tail.Text = "Tail : ON"
Tail.BackgroundColor3 = Color3.fromRGB(0,255,120)
end

end)

Ring.MouseButton1Click:Connect(function()

local state = not RingEnabled

DisableAll()

RingEnabled = state

if RingEnabled then
Ring.Text = "Ring : ON"
Ring.BackgroundColor3 = Color3.fromRGB(0,255,120)
end

end)

Rainbow.MouseButton1Click:Connect(function()

RainbowEnabled = not RainbowEnabled

if RainbowEnabled then

Rainbow.Text = "Rainbow : ON"    
Rainbow.BackgroundColor3 = Color3.fromRGB(0,255,120)

else

Rainbow.Text = "Rainbow : OFF"    
Rainbow.BackgroundColor3 = Color3.fromRGB(255,0,255)

end

end)


---

-- PROP CACHE

local CachedProps = {}

local function UpdateProps()

table.clear(CachedProps)

local Folder =
workspace
.WorkspaceCom
:FindFirstChild("001_TrafficCones")

if not Folder then
return
end

for _,prop in ipairs(Folder:GetChildren()) do

if prop.Name:find("Prop" .. player.Name) then    

	local remote =    
		prop:FindFirstChild("SetCurrentCFrame")    

	if remote then    

		table.insert(    
			CachedProps,    
			{    
				Model = prop,    
				Remote = remote    
			}    
		)    
	end    
end

end

end

UpdateProps()

workspace.WorkspaceCom.DescendantAdded:Connect(function()
task.wait(0.2)
UpdateProps()
end)


---

-- RESET

Reset.MouseButton1Click:Connect(function()

DisableAll()

for i,data in ipairs(CachedProps) do

local farPos = Vector3.new(    
	999999 + (i * 10),    
	-9999,    
	999999 + (i * 10)    
)    

pcall(function()    
	data.Remote:InvokeServer(    
		CFrame.new(farPos)    
	)    
end)

end

end)


---

-- AUTO RAINBOW

task.spawn(function()

while true do

if RainbowEnabled then    

	local Folder =    
		workspace.WorkspaceCom["001_TrafficCones"]    

	local props = {}    

	for _,prop in ipairs(Folder:GetChildren()) do    

		if prop.Name:find("Prop" .. player.Name) then    
			table.insert(props,prop)    
		end    
	end    

	local total = #props    

	for i,prop in ipairs(props) do    

		local remote =    
			prop:FindFirstChild("ChangePropColor")    

		if remote then    

			local hue =    
				(i / total)    
				+ (tick() * 0.05)    

			local color =    
				Color3.fromHSV(    
					hue % 1,    
					1,    
					1    
				)    

			pcall(function()    
				remote:InvokeServer(color)    
			end)    
		end    
	end    
end    

task.wait(0.1)

end

end)


---

-- MAIN LOOP

RunService.RenderStepped:Connect(function()

local count = #CachedProps

if count <= 0 then
return
end

-- STOP TOTAL SAAT OFF
if not OrbitEnabled
and not WingsEnabled
and not TailEnabled
and not RingEnabled then
return
end

local time = tick()

for i,data in ipairs(CachedProps) do

local offset = Vector3.zero    
local rotation = CFrame.new()    

---------------------------------------------------    
-- ORBIT (ASLI)    
---------------------------------------------------    

if OrbitEnabled then

	local radius = 8

	-- tiap 0.3 detik pindah posisi
	local stepDelay = 0.3

	-- besar putaran tiap teleport
	local stepRotation = math.rad(15)

	-- hitung step
	local currentStep =
		math.floor(tick() / stepDelay)

	local angle =
		((i - 1) / count)
		* math.pi * 2
		+ (currentStep * stepRotation)

	offset = Vector3.new(
		math.cos(angle) * radius,
		-3,
		math.sin(angle) * radius
	)

end

---

-- WINGS    
---------------------------------------------------

if WingsEnabled then

	local torso =
		character:FindFirstChild("UpperTorso")
		or character:FindFirstChild("Torso")

	local bodyCF =
		torso and torso.CFrame or hrp.CFrame

	local spacing = 1

	local center =
		(count + 1) / 2

	local side =
		i - center

	local stepDelay = 0.3

	local currentStep =
		math.floor(tick() / stepDelay)

	local flap =
		math.sin(currentStep * 0.8)

	local x =
		side * spacing

	local z =
		math.abs(side)
		* flap
		* -1

	offset = Vector3.new(
		x,
		0,
		z - 2
	)

	local worldPos =
		bodyCF.Position
		+ bodyCF:VectorToWorldSpace(offset)

	local tilt = 0

if i == 1 then
	tilt = math.rad(35)

elseif i == count then
	tilt = math.rad(-35)
end

local cf =
	CFrame.new(worldPos)
	* bodyCF.Rotation
	* CFrame.Angles(0, tilt, 0)

	pcall(function()
		data.Remote:InvokeServer(cf)
	end)

	continue
			end

---

-- RING    
---------------------------------------------------    

if RingEnabled then    

	local radius = 5    

	local angle =    
		((i - 1) / count)    
		* math.pi * 2    
		+ time * 2    

	offset = Vector3.new(    
		math.cos(angle) * radius,    
		math.sin(angle * 2) * 2,    
		math.sin(angle) * radius    
	)    
end    

local worldPos =    
	hrp.Position    
	+ hrp.CFrame:VectorToWorldSpace(offset)    

local cf =    
	CFrame.new(worldPos)    
	* hrp.CFrame.Rotation    
	* rotation    

pcall(function()    
	data.Remote:InvokeServer(cf)    
end)

end

end)


---

-- DRAG

local function MakeDraggable(frame)

local dragging = false
local dragInput
local dragStart
local startPos

frame.InputBegan:Connect(function(input)

if input.UserInputType    
	== Enum.UserInputType.Touch    
or input.UserInputType    
	== Enum.UserInputType.MouseButton1 then    

	dragging = true    
	dragStart = input.Position    
	startPos = frame.Position    
end

end)

frame.InputChanged:Connect(function(input)

if input.UserInputType    
	== Enum.UserInputType.Touch    
or input.UserInputType    
	== Enum.UserInputType.MouseMovement then    

	dragInput = input    
end

end)

UIS.InputChanged:Connect(function(input)

if dragging and input == dragInput then    

	local delta =    
		input.Position - dragStart    

	frame.Position = UDim2.new(    
		startPos.X.Scale,    
		startPos.X.Offset + delta.X,    
		startPos.Y.Scale,    
		startPos.Y.Offset + delta.Y    
	)    
end

end)

UIS.InputEnded:Connect(function(input)

if input.UserInputType    
	== Enum.UserInputType.Touch    
or input.UserInputType    
	== Enum.UserInputType.MouseButton1 then    

	dragging = false    
end

end)

end

MakeDraggable(Main)
MakeDraggable(Bubble)
