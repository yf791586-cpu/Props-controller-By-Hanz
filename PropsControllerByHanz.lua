local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

---------------------------------------------------
-- STATUS
---------------------------------------------------

local OrbitEnabled = false
local WingsEnabled = false
local TailEnabled = false
local RingEnabled = false
local RainbowEnabled = false
local WingsAnimationEnabled = true -- 🔥 tambahan

---------------------------------------------------
-- GUI (ASLI KAMU)
---------------------------------------------------

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- (SEMUA GUI KAMU TETAP SAMA, TIDAK DIHAPUS)
-- ⛔ aku tidak ubah bagian ini sama sekali

---------------------------------------------------
-- FLOATING BUBBLE (ASLI)
---------------------------------------------------

local Bubble = Instance.new("TextButton")
Bubble.Parent = ScreenGui
Bubble.Size = UDim2.new(0,70,0,70)
Bubble.Position = UDim2.new(0.1,0,0.5,0)
Bubble.Text = "Hanz"
Bubble.Visible = false

---------------------------------------------------
-- 🔥 WINGS FLOAT BUTTON (BARU)
---------------------------------------------------

local WingsFloat = Instance.new("TextButton")
WingsFloat.Parent = ScreenGui
WingsFloat.Size = UDim2.new(0,80,0,40)
WingsFloat.Position = UDim2.new(0.8,0,0.6,0)
WingsFloat.BackgroundColor3 = Color3.fromRGB(0,170,255)
WingsFloat.Text = "Wings FX : ON"
WingsFloat.TextColor3 = Color3.new(1,1,1)
WingsFloat.Font = Enum.Font.GothamBold
WingsFloat.TextSize = 14
WingsFloat.Visible = false

Instance.new("UICorner", WingsFloat)

---------------------------------------------------
-- DRAG (ASLI)
---------------------------------------------------

local function MakeDraggable(frame)

local dragging = false
local dragInput
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
dragStart = input.Position
startPos = frame.Position
end
end)

frame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseMovement then
dragInput = input
end
end)

UIS.InputChanged:Connect(function(input)
if dragging and input == dragInput then
local delta = input.Position - dragStart
frame.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end)

UIS.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end)

end

MakeDraggable(Bubble)
MakeDraggable(WingsFloat)

---------------------------------------------------
-- WINGS FX BUTTON
---------------------------------------------------

WingsFloat.MouseButton1Click:Connect(function()

WingsAnimationEnabled = not WingsAnimationEnabled

if WingsAnimationEnabled then
WingsFloat.Text = "Wings FX : ON"
WingsFloat.BackgroundColor3 = Color3.fromRGB(0,255,120)
else
WingsFloat.Text = "Wings FX : OFF"
WingsFloat.BackgroundColor3 = Color3.fromRGB(255,60,60)
end

end)

---------------------------------------------------
-- PROP CACHE (ASLI)
---------------------------------------------------

local CachedProps = {}

local function UpdateProps()

table.clear(CachedProps)

local Folder =
workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")

if not Folder then return end

for _,prop in ipairs(Folder:GetChildren()) do
if prop.Name:find("Prop" .. player.Name) then

local remote = prop:FindFirstChild("SetCurrentCFrame")

if remote then
table.insert(CachedProps,{
Model = prop,
Remote = remote
})
end

end
end

end

UpdateProps()

workspace.WorkspaceCom.DescendantAdded:Connect(function()
task.wait(0.2)
UpdateProps()
end)

---------------------------------------------------
-- MAIN LOOP (FULL)
---------------------------------------------------

RunService.RenderStepped:Connect(function()

local count = #CachedProps
if count <= 0 then return end

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
-- ORBIT (ASLI KAMU)
---------------------------------------------------

if OrbitEnabled then

local minRadius = 14
local maxRadius = 30
local waveSpeed = 1.5
local stepDelay = 0.05
local stepRotation = math.rad(3)

local currentStep = math.floor(tick() / stepDelay)

local wave = (math.sin(tick() * waveSpeed) + 1) / 2

local radius = minRadius + (maxRadius - minRadius) * wave

local angle =
((i - 1) / count) * math.pi * 2
+ (currentStep * stepRotation)

offset = Vector3.new(
math.cos(angle) * radius,
-3,
math.sin(angle) * radius
)

end

---------------------------------------------------
-- 🔥 WINGS (SUDAH DI-UPGRADE)
---------------------------------------------------

if WingsEnabled then

local torso =
character:FindFirstChild("UpperTorso")
or character:FindFirstChild("Torso")

local bodyCF =
torso and torso.CFrame or hrp.CFrame

local center = (count + 1) / 2
local side = i - center

local t = WingsAnimationEnabled and tick() or 0

local flap = math.sin((t * 5) + (i * 0.25))
local spread = math.abs(side)

local x = side * 1.6
local y = (spread * 0.8) - 1.5 + (flap * 1.0)
local z = 2

local worldPos =
bodyCF.Position
+ bodyCF:VectorToWorldSpace(Vector3.new(x,y,z))

local tiltZ = math.rad(side * 14 + flap * 6)

local cf =
CFrame.new(worldPos)
* bodyCF.Rotation
* CFrame.Angles(0,0,-tiltZ)

pcall(function()
data.Remote:InvokeServer(cf)
end)

continue
end

---------------------------------------------------
-- RING (ASLI)
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

---------------------------------------------------

local worldPos =
hrp.Position
+ hrp.CFrame:VectorToWorldSpace(offset)

local cf

if OrbitEnabled then

local targetPos =
Vector3.new(
hrp.Position.X,
worldPos.Y,
hrp.Position.Z
)

cf = CFrame.lookAt(worldPos, targetPos)

else

cf =
CFrame.new(worldPos)
* hrp.CFrame.Rotation
* rotation

end

pcall(function()
data.Remote:InvokeServer(cf)
end)

end

end)
