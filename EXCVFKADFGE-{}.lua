local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownproootest/Unknown-TreasureQuest/Alt/Test_FixMinimizeKey"))()

local openshit = Instance.new("ScreenGui")
local mainopen = Instance.new("TextButton")
local mainopens = Instance.new("UICorner")
local loki = Instance.new("ImageLabel")
local posto = Instance.new("UIStroke")

openshit.Name = "openshit"
openshit.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
openshit.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
openshit.ResetOnSpawn = false

mainopen.Name = "mainopen"
mainopen.Parent = openshit
mainopen.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainopen.Position = UDim2.new(0.101969875, 0, 0.110441767, 0)
mainopen.Size = UDim2.new(0, 64, 0, 42)
mainopen.Text = ""
mainopen.Visible = true
mainopens.Parent = mainopen
 
loki.Name = "loki"
loki.Parent = mainopen
loki.BackgroundColor3 = Color3.fromRGB(224,224,224)
loki.BackgroundTransparency = 1.000
loki.Position = UDim2.new(-0.0529999994, 0, -0.244000003, 0)
loki.Size = UDim2.new(0, 69, 0, 62)
loki.Image = "rbxassetid://73949062338801"
 
posto.Name = "posto"
posto.Parent = mainopen
posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
posto.Color = Color3.fromRGB(224,224,224)
posto.LineJoinMode = Enum.LineJoinMode.Round
posto.Thickness = 1
posto.Transparency = 0
posto.Enabled = true
posto.Archivable = true
 
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
 
local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
    
    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
            Position = pos
        })
        Tween:Play()
    end
    
    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position
                
                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )
    
    topbarobject.InputChanged:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                DragInput = input
            end
        end
    )
    
    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

MakeDraggable(mainopen, mainopen) -- Making the button draggable

local RunService = game:GetService("RunService")
local fpsCounter = Instance.new("ScreenGui")
fpsCounter.Parent = game.CoreGui
fpsCounter.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
fpsCounter.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1.000
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.GothamBlack
label.Size = UDim2.new(0, 150, 0, 70)
label.Position = UDim2.new(0, 200, 0, 10)
label.Text = "FPS: 0\nTime Played: 0h 0m 0s"
label.TextSize = 10
label.Parent = fpsCounter

local startTime = tick()
local lastUpdateTime = tick()
local frameCount = 0

RunService.RenderStepped:Connect(function()
    local currentTime = tick()
    local deltaTime = currentTime - lastUpdateTime
    frameCount = frameCount + 1
    
    if frameCount == 1 and untilloaded == true then
       game:GetService("Players").LocalPlayer:Kick("Device Saver: CRASH DETECTED")
    end

    if deltaTime >= 1 then
        local fps = math.round(frameCount / deltaTime)
        local elapsedTime = currentTime - startTime

        local hours = math.floor(elapsedTime / 3600)
        local minutes = math.floor((elapsedTime % 3600) / 60)
        local seconds = math.floor(elapsedTime % 60)

        label.Text = "FPS: " .. fps .. "\nClient Timer: " .. hours .. "h " .. minutes .. "m " .. seconds .. "s"

        lastUpdateTime = currentTime
        frameCount = 0
    end
end)

if not require then
    return game:GetService("Players").LocalPlayer:Kick("UNC RESTRICTION MISSING: require(path) | PLEASE TRY OTHER EXECUTORS")
else
print("Supported require()")
end

if not firetouchinterest  then
    return game:GetService("Players").LocalPlayer:Kick("UNC RESTRICTION MISSING: firetouchinterest() | PLEASE TRY OTHER EXECUTORS")
else
print("Supported firetouchinterest()")
end

if not setfpscap or setfpscap(500) then
    return game:GetService("Players").LocalPlayer:Kick("UNC RESTRICTION MISSING: setfpscap() | PLEASE TRY OTHER EXECUTORS")
else
print("Supported setfpscap()")
end

if not setfflag then
    return game:GetService("Players").LocalPlayer:Kick("UNC RESTRICTION MISSING: setfflag() | PLEASE TRY OTHER EXECUTORS")
else
print("Supported setfflag()")
end

if not getgc then
    return game:GetService("Players").LocalPlayer:Kick("UNC RESTRICTION MISSING: getgc() | PLEASE TRY OTHER EXECUTORS")
else
print("Supported hookmetamethod()")
end

if game.Players then
print("Advance Api")
else
print("Common Api")
end

local SizeGuiX = 580
local SizeGuiZ = 460

local Window = Fluent:CreateWindow({
    Title = "Unknown Hub X Evade (Overhaul)",
    SubTitle = "V2 Made by Unknownproooolucky discord.gg/d2a3KkTD6r",
    TabWidth = 160,
    Size = UDim2.fromOffset(SizeGuiX, SizeGuiZ),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

mainopen.MouseButton1Click:Connect(function()
   Window:Minimize()
end)


local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    AutoFarm = Window:AddTab({ Title = "Auto Farms", Icon = "" }),
    Nextbot = Window:AddTab({ Title = "Nextbot Mods", Icon = "" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
    Settings = Window:AddTab({ Title = "Save Config", Icon = "rbxassetid://7734052335" }),
    Admin = Window:AddTab({ Title = "", Icon = "" })
}

local Options = Fluent.Options


-- Main

Tabs.Main:AddParagraph({
        Title = "ESP Features",
        Content = " "
    })

function Simple_Create(base, name, trackername, studs)
    local bb = Instance.new("BillboardGui")
    bb.Adornee = base
    bb.ExtentsOffset = Vector3.new(0, 1, 0)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 6, 0, 6)
    bb.StudsOffset = Vector3.new(0, 1, 0)
    bb.Name = trackername
    bb.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.ZIndex = 10
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.new(3, 0, 3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = bb

    -- Add UICorner to make the frame circular
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0.5, 0)
    uiCorner.Parent = frame

    local txtlbl = Instance.new("TextLabel")
    txtlbl.ZIndex = 10
    txtlbl.BackgroundTransparency = 1
    txtlbl.Position = UDim2.new(0, 0, 0, -48)
    txtlbl.Size = UDim2.new(1, 0, 10, 0)
    txtlbl.Font = Enum.Font.SourceSans
    txtlbl.Text = name
    txtlbl.TextSize = 14    
    txtlbl.TextStrokeTransparency = 0.5
    txtlbl.TextColor3 = Color3.fromRGB(255, 0, 0)
    txtlbl.Parent = bb
    
    local txtdistance = Instance.new("TextLabel")
    txtdistance.ZIndex = 10
    txtdistance.BackgroundTransparency = 1
    txtdistance.Position = UDim2.new(0, 0, 0, -30)
    txtdistance.Size = UDim2.new(1, 0, 10, 0)
    txtdistance.Font = Enum.Font.SourceSans
    txtdistance.TextSize = 14
    txtdistance.TextStrokeTransparency = 0.5
    txtdistance.TextColor3 = Color3.fromRGB(255, 255, 255)
    txtdistance.Parent = bb
    
    local distance = math.floor((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - base.Position).Magnitude)
    
    txtdistance.Text = distance.. " M"
end

function ClearESP(espname)
	for _, v in pairs(game.CoreGui:GetChildren()) do
		if v.Name == espname and v:isA("BillboardGui") then
			v:Destroy()
		end
	end
end

function nowaterdmg(t)
	for i, v in next, t:GetChildren() do
		if v.IsA(v, 'BasePart') then
			v.CanTouch = false
		end
	end
end

local BotESP = false

local Toggle = Tabs.Main:AddToggle("ESPBot", {Title = "ESP Bot", Default = false })

    Toggle:OnChanged(function(State)
        BotESP = State
        
        task.spawn(
                function()
			while task.wait(1) do
				ClearESP('AI_Tracker')
				if not BotESP then
					break
				end
				pcall(function()
					local GamePlayers = workspace.Game.Players
					for i, v in pairs(GamePlayers:GetChildren()) do
						if not game.Players:FindFirstChild(v.Name) then
							Simple_Create(v.HumanoidRootPart, v.Name, "AI_Tracker")
						end
					end
				end)
			end
	 end)
 end)
    
local PlayerESP = false

local Toggle = Tabs.Main:AddToggle("ESPPlayers", {Title = "ESP Players", Default = false })

Toggle:OnChanged(function(State)
    PlayerESP = State
   
        while PlayerESP and wait(1) do
            pcall(function()
                if PlayerESP then
                    local localPlayer = game:GetService("Players").LocalPlayer
                    local localCharacter = localPlayer.Character
                    local localHumanoidRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
                    
                    if not localHumanoidRootPart then
                        return
                    end

                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local character = player.Character
                            local humanoidRootPart = character.HumanoidRootPart

                            if not humanoidRootPart:FindFirstChild("PlayerESP") then
                                local BillboardGui = Instance.new("BillboardGui")
                                local TextLabel = Instance.new("TextLabel")

                                BillboardGui.Parent = humanoidRootPart
                                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                BillboardGui.Name = "PlayerESP"
                                BillboardGui.AlwaysOnTop = true
                                BillboardGui.LightInfluence = 1.000
                                BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                                BillboardGui.MaxDistance = 500

                                TextLabel.Parent = BillboardGui
                                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.BackgroundTransparency = 1.000
                                TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                TextLabel.TextScaled = false
                                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.Font = Enum.Font.SourceSans
                                TextLabel.TextSize = 14
                            end

                            local distance = math.floor((localHumanoidRootPart.Position - humanoidRootPart.Position).Magnitude)
                            local labelText = string.format("%s - %d M", player.Name, distance)

                            local gamePlayer = workspace:WaitForChild("Game", 1337).Players:FindFirstChild(player.Name)
                            if gamePlayer and gamePlayer:GetAttribute('Downed') == true then
                                humanoidRootPart.PlayerESP.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                labelText = labelText .. " (Downed)"
                            elseif gamePlayer and gamePlayer:GetAttribute('Team') == "Nextbot" then
                                humanoidRootPart.PlayerESP.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                labelText = labelText .. " (Enemy)"
                            else
                                humanoidRootPart.PlayerESP.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            end
                            
                            humanoidRootPart.PlayerESP.TextLabel.Text = labelText
                        end
                    end
                else
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local humanoidRootPart = player.Character.HumanoidRootPart
                            local esp = humanoidRootPart:FindFirstChild("PlayerESP")
                            if esp then
                                esp:Destroy()
                            end
                        end
                    end
                end
            end)
        end
end)

local ObjectiveESP = false

local Toggle = Tabs.Main:AddToggle("ESPObjective", {Title = "ESP Objective", Default = false })

    Toggle:OnChanged(function(State)
        ObjectiveESP = State
        
	
while ObjectiveESP and wait(0.4) do
 pcall(function()
        if ObjectiveESP and workspace.Game.Map.Parts:FindFirstChild("Objectives") then
            local localPlayer = game:GetService("Players").LocalPlayer
            local localCharacter = localPlayer.Character
            local localHumanoidRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

            if not localHumanoidRootPart then
                return
            end

         for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
			if v.IsA(v, "Model") then
                    if not v:FindFirstChild("ObjectiveESP") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        -- Billboard settings
                        BillboardGui.Parent = v:FindFirstChildWhichIsA("BasePart")
                        BillboardGui.Name = "ObjectiveESP"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        BillboardGui.MaxDistance = 500

                        -- TextLabel settings
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.new(1, 1, 1) -- White background
                        TextLabel.BackgroundTransparency = 1 -- Fully transparent
                        TextLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill the billboard
                        TextLabel.Text = "(OBJECTIVES)" -- Display the grandparent name
                        TextLabel.TextColor3 = Color3.new(1, 0, 0) -- Red text
                        TextLabel.TextScaled = true -- Scale text to fit
                        TextLabel.Font = Enum.Font.GothamBold -- Set font to GothamBold
                    end
                    
                   local distance = math.floor((localHumanoidRootPart.Position - v.Position).Magnitude)
                    v.ObjectiveESP.TextLabel.Text = string.format("(OBJECTIVES) - %d M", distance)
                end
            end
        else
            for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
	  		if v.IsA(v, "Model") then
                if v:FindFirstChildWhichIsA("BasePart") and v:FindFirstChild("ObjectiveESP") then
                    v.ObjectiveESP:Destroy()
                   end
                end
            end
        end
    end)
  end
 end)

local ESPTickets = false

local Toggle = Tabs.Main:AddToggle("ESPTicket", {Title = "ESP Tickets", Default = false })

    Toggle:OnChanged(function(State)
        ESPTickets = State
        
        while ESPTickets and wait(0.4) do
        local highlight = workspace.Game.Effects:FindFirstChild("TicketHighlight")

if highlight then
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.5  -- Adjust transparency (0 is fully opaque)
    highlight.OutlineTransparency = 0  -- Ensure the outline is visible
    highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Example: Set fill color to red
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  -- Example: Set outline color to white
end
 pcall(function()
        if ESPTickets then
            local localPlayer = game:GetService("Players").LocalPlayer
            local localCharacter = localPlayer.Character
            local localHumanoidRootPart = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")

            if not localHumanoidRootPart then
                return
            end

            for _, v in pairs(game.Workspace.Game.Effects.Tickets:GetDescendants()) do
                if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
                    if not v:FindFirstChild("TicketESP") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        -- Billboard settings
                        BillboardGui.Parent = v 
                        BillboardGui.Name = "TicketESP"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        BillboardGui.MaxDistance = 500

                        -- TextLabel settings
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.new(1, 1, 1) -- White background
                        TextLabel.BackgroundTransparency = 1 -- Fully transparent
                        TextLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill the billboard
                        TextLabel.Text = "Candy Corn" -- Display the grandparent name
                        TextLabel.TextColor3 = Color3.new(1, 0, 0) -- Red text
                        TextLabel.TextScaled = true -- Scale text to fit
                        TextLabel.Font = Enum.Font.GothamBold -- Set font to GothamBold
                    end
                    
                   local distance = math.floor((localHumanoidRootPart.Position - v.Position).Magnitude)
                    v.TicketESP.TextLabel.Text = string.format("Ticket - %d M", distance)
                end
            end
        else
            for _, v in pairs(game.Workspace.Game.Effects.Tickets:GetDescendants()) do
                if v:IsA("MeshPart") and v:FindFirstChild("TicketESP") then
                    v.TicketESP:Destroy()
                end
            end
        end
    end)
    end
 end)


Tabs.Main:AddParagraph({
        Title = "Game Mods Features",
        Content = " "
    })
    
local AutoRespawn = false

local Toggle = Tabs.Main:AddToggle("AutoRespawn", {Title = "Auto Respawn", Default = false })

    Toggle:OnChanged(function(State)
        AutoRespawn = State
      repeat
      wait(0.1)
      if AutoRespawn then
		 local char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
		   if char and char:GetAttribute("State") == "Downed" then
		        game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true)
	      	end
	       end
		until AutoRespawn == false
    end)

local AutoWhistle = false

function autowistlefunction()
   game:GetService("ReplicatedStorage").Events.Character.Whistle:FireServer()
end

local Toggle = Tabs.Main:AddToggle("AutoRespawn", {Title = "Auto Whistle", Default = false })

    Toggle:OnChanged(function(State)
        AutoWhistle = State
      while task.wait(1) and AutoWhistle do
			autowistlefunction()
		end
    end)
    
function timernotify()
local player = game.Players.LocalPlayer

-- Create a new ScreenGui and Frame
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false
screenGui.Name = "TimerGui"

-- Create a TextLabel for the timer
local timerLabel = Instance.new("TextLabel")
timerLabel.Parent = screenGui
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0) -- Centered on screen
timerLabel.BackgroundTransparency = 1 -- Make background invisible
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.GothamBold
timerLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
end

function detimer()
local player = game.Players.LocalPlayer

if player.PlayerGui:FindFirstChild("TimerGui") then
    player.PlayerGui.TimerGui:Destroy()
  end
end

local TimerText = false

local Toggle = Tabs.Main:AddToggle("TimerNotifier", {Title = "Timer Notifier", Default = false })

    Toggle:OnChanged(function(State)
    TimerText = State

   if TimerText then
   timernotify()
else
   detimer()
  end

    while TimerText and wait(0.1) do
       if game.Players.LocalPlayer.PlayerGui:FindFirstChild("TimerGui") then
             game.Players.LocalPlayer.PlayerGui.TimerGui.TextLabel.Text = workspace.Game.Stats:GetAttribute("Timer")
           end
        end
    end)
 
local NoDamage = false

function disabletouch()
if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
     nowaterdmg(game:GetService("Players").LocalPlayer.Character)
    end
end

local Toggle = Tabs.Main:AddToggle("RemoveDamageParts", {Title = "Remove Damage Parts", Default = false })

    Toggle:OnChanged(function(State)
    NoDamage = State
repeat
wait(0.1)
if NoDamage then
spawn(disabletouch)
		end  
	 until NoDamage == false
    end)
    
Tabs.Main:AddParagraph({
        Title = "Character Mods",
        Content = " "
    })
    
local Toggle = Tabs.Main:AddToggle("Noclip", {Title = "Noclip", Default = false })

local NoClipx = false

local function Noclip()
            pcall(function()
                for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                 end
            end
      end)
end

    Toggle:OnChanged(function(State)
NoClipx = State
repeat
if NoClipx then
   Noclip()
       wait(0.1)
        end
       until not NoClipx == true
    end)

Options.Noclip:SetValue(false)

local RunService = game:GetService("RunService")

local FLYING = false
local velocityHandlerName = "VelocityHandler"
local gyroHandlerName = "GyroHandler"
local mfly1, mfly2
local currentCharacter

local function getRoot(character)
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
end

local function unmobilefly(player)
    pcall(function()
        FLYING = false
        local character = player.Character
        if character then
            local root = getRoot(character)
            if root then
                local velocityHandler = root:FindFirstChild(velocityHandlerName)
                local gyroHandler = root:FindFirstChild(gyroHandlerName)

                if velocityHandler then
                    velocityHandler:Destroy()
                end

                if gyroHandler then
                    gyroHandler:Destroy()
                end

                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = false
                end
            end
        end

        if mfly1 then
            mfly1:Disconnect()
        end

        if mfly2 then
            mfly2:Disconnect()
        end
    end)
end

local function mobilefly(player, vfly)
    unmobilefly(player)
    FLYING = true

    local character = player.Character
    local root = getRoot(character)

    if character and root then
        local camera = workspace.CurrentCamera
        local v3none = Vector3.new()
        local v3zero = Vector3.new(0, 0, 0)
        local v3inf = Vector3.new(9e9, 9e9, 9e9)

        local controlModule = require(player.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        local bv = Instance.new("BodyVelocity")
        bv.Name = velocityHandlerName
        bv.Parent = root
        bv.MaxForce = v3zero
        bv.Velocity = v3zero

        local bg = Instance.new("BodyGyro")
        bg.Name = gyroHandlerName
        bg.Parent = root
        bg.MaxTorque = v3inf
        bg.P = 1000
        bg.D = 2

        mfly1 = player.CharacterAdded:Connect(function()
            unmobilefly(player)
            currentCharacter = player.Character
            mobilefly(player, vfly)
        end)

        mfly2 = RunService.RenderStepped:Connect(function()
            root = getRoot(player.Character)
            camera = workspace.CurrentCamera
            if player.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
                local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
                local VelocityHandler = root:FindFirstChild(velocityHandlerName)
                local GyroHandler = root:FindFirstChild(gyroHandlerName)

                if VelocityHandler and GyroHandler then
                    VelocityHandler.MaxForce = v3inf
                    GyroHandler.MaxTorque = v3inf

                    if not vfly and humanoid then
                        humanoid.PlatformStand = false
                    end

                    GyroHandler.CFrame = camera.CoordinateFrame
                    VelocityHandler.Velocity = v3none

                    local direction = controlModule:GetMoveVector()
                    if direction.X ~= 0 or direction.Z ~= 0 then
                        local moveVector = Vector3.new(direction.X, 0, direction.Z).unit
                        local rightVector = camera.CFrame.RightVector
                        local forwardVector = camera.CFrame.LookVector

                        local flyDirection = (rightVector * moveVector.X - forwardVector * moveVector.Z).unit

                        VelocityHandler.Velocity = flyDirection * (_G.flySpeed * 20)
                        RunService.RenderStepped:Wait()
                    end
                end
            end
        end)
    end
end

local function toggleFly(player, toggleValue)
    if toggleValue then
        mobilefly(player, true)
    else
        unmobilefly(player)
    end
end

-- Your loop structure
_G.loops = false

local function flyLoop()
    while wait(10) do
        if _G.loops then
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character then
                mobilefly(player, true)
            end
        end
    end
end

local Toggle = Tabs.Main:AddToggle("FlyToggle", { Title = "Fly Toggle", Default = false })

Toggle:OnChanged(function()
    local player = game:GetService("Players").LocalPlayer
    _G.loops = Toggle.Value
    toggleFly(player, Toggle.Value)
end)

Options.FlyToggle:SetValue(false)

_G.flySpeed = 20  -- Default fly speed

local FlySpeedInput = Tabs.Main:AddInput("FlySpeedInput", {
    Title = "Fly Speed",
    Default = tostring(_G.flySpeed),
    Placeholder = "Enter fly speed",
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        _G.flySpeed = tonumber(Value) or 20
        toggleFly(player, Toggle.Value)
    end
})

-- Start the loop
spawn(flyLoop)

Tabs.Main:AddParagraph({
        Title = "Manual",
        Content = " "
    })

Tabs.Main:AddButton({
        Title = "Respawn Button",
        Description = "",
        Callback = function()
        game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true)
        end
    })
    
Tabs.Main:AddButton({
        Title = "Open Leaderboard (PC Mode)",
        Description = "",
        Callback = function()
           game:GetService("VirtualInputManager"):SendKeyEvent(true, "Tab", false, game)
        end
    })

-- AutoFarm

Tabs.AutoFarm:AddParagraph({
        Title = "Farming Features",
        Content = "Recommend: Enable Quick Revive"
    })

local FarmMoney = false
local FarmTickets = false
local AFKFarm = false
local WorkspacePlayers = game:GetService("Workspace").Game.Players 

local GetDownedPlr = function()
    for i,v in pairs(WorkspacePlayers:GetChildren()) do
        if v:GetAttribute("Downed") then
            return v
        end
    end
end

local revive = function()
    local downedplr = GetDownedPlr()
    if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
        task.spawn(function()
            while task.wait() do
                if game:GetService("Players").LocalPlayer.Character then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
                    task.wait()
                    game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", false, tostring(downedplr))
                    task.wait(4.5)
                    game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(downedplr))
                    game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(downedplr))
                    game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(downedplr))
                    break
                end
            end
        end)
    end
end

task.spawn(function()
    while task.wait() do
        if FarmMoney then
            if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:GetAttribute("State") == "Downed" then
                game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true)
                task.wait(3)
            else
                revive()
                task.wait(1)
            end
        end
        if FarmMoney == false and AFKFarm and game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart') ~= nil then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, -5000, 0))
            wait(3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 5000, 0))
            wait(3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(5000, 0, 0))
            wait(3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 0, 5000))
        end
    end
end)

local Toggle = Tabs.AutoFarm:AddToggle("AutoFarmMoney", {Title = "Auto Farm Money", Default = false })

    Toggle:OnChanged(function(State)
    FarmMoney = State
    end)

local Toggle = Tabs.AutoFarm:AddToggle("AutoFarmTickets", {Title = "Auto Farm Tickets", Default = false })

    Toggle:OnChanged(function(State)
    FarmTickets = State
if FarmTickets then
         part = Instance.new("Part", workspace)
			part.Anchored = true
			part.CFrame = CFrame.new(1000, 4996, 1000)
		end
		while task.wait(0.5) and FarmTickets do
			if not FarmTickets then
				break
			end
			local char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
			local tickets = workspace.Game.Effects.Tickets
			local hrp = char:WaitForChild("HumanoidRootPart", 3)
			if hrp == nil then
				return
			end
			game:GetService("ReplicatedStorage").Events.Other.TicketsEvent:FireServer(hrp.Position)
			hrp.CFrame = CFrame.new(1000, 5000, 1000)
			for i, v in next, tickets:GetDescendants() do
				if v.IsA(v, "BasePart") and v.Name == "HumanoidRootPart" then
					hrp.CFrame = CFrame.new(v.Position)
				end
			end
		end
    end)
    
local Toggle = Tabs.AutoFarm:AddToggle("AFKFarm", {Title = "AFK Farm", Default = false })

    Toggle:OnChanged(function(State)
    AFKFarm = State
    end)
    
Tabs.AutoFarm:AddParagraph({
        Title = "Teleports",
        Content = ""
    })

function tptoobjective()
local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	if workspace.Game.Map.Parts:FindFirstChild("Objectives") then
		for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
			if v.IsA(v, "Model") then
				hrp.CFrame = CFrame.new(v:FindFirstChildWhichIsA("BasePart").Position)
			end
		end
	end
end

Tabs.AutoFarm:AddButton({
        Title = "Teleport to Objective",
        Description = "",
        Callback = function()
        tptoobjective()
        end
    })
    
-- Nextbot

Tabs.Nextbot:AddParagraph({
        Title = "Anti Nextbot",
        Content = " "
    })

local SelectTeleportation = "Spawn"
local AntiNextbotDistance = 15

function AntiNextbot()
    if game.Workspace:FindFirstChild("Game") and game.Workspace.Game:FindFirstChild("Players") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    
        local playerTeam = game.Workspace.Game.Players[game.Players.LocalPlayer.Name]:GetAttribute("Team")
        if playerTeam == "Nextbot" then
            return -- Exit the function if the player is on the "Nextbot" team
        end
    
        for i, v in pairs(game.Workspace.Game.Players:GetDescendants()) do
            if v:IsA("Model") and v:GetAttribute("Team") == "Nextbot" then
                local humanoidRootPart = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("HRP")
                if humanoidRootPart then
                    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude
                    
                    if distance < AntiNextbotDistance then
                        if SelectTeleportation == "Spawn" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, -50000, 0))                         
                        elseif SelectTeleportation == "Players" then
                            local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(randomPlayer.Character.Head.Position.X, randomPlayer.Character.Head.Position.Y, randomPlayer.Character.Head.Position.Z))
                        end
                    end
                end
            end
        end
    end
end

local AntiNextbotT = falae

local Toggle = Tabs.Nextbot:AddToggle("AntiNextbotToggle", {Title = "Anti Nextbot Toggle", Default = false })

    Toggle:OnChanged(function(Val)
    AntiNextbotT = Val
        
    while AntiNextbotT and wait(0.1) do
       AntiNextbot()
       end
    end)

local Dropdown = Tabs.Nextbot:AddDropdown("AntiBotTeleport", {
        Title = "Anti Nextbot Teleport Type",
        Values = {"Spawn", "Players"},
        Multi = false,
        Default = 1,
    })

    Dropdown:OnChanged(function(Value)
        SelectTeleportation = Value
    end)
    
 local Input = Tabs.Nextbot:AddInput("NextbotDistance", {
    Title = "Anti Nextbot Distance",
    Default = 15,
    Placeholder = "Number",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        -- Convert the input value to a number
        AntiNextbotDistance = tonumber(Value) or 15 -- Default to 15 if the conversion fails
    end
})

-- Misc

Tabs.Misc:AddParagraph({
        Title = "Game Features",
        Content = " "
    })
    
local WorkspacePlayers = game:GetService("Workspace").Game.Players

local function getNearestDownedPlayer()
    local nearestPlayer = nil
    local nearestDistance = 1000
    
    local localPlayer = game.Players.LocalPlayer
    local localPlayerPosition = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character.HumanoidRootPart.Position

    for _, player in pairs(WorkspacePlayers:GetChildren()) do
        if player:GetAttribute("Downed") and player:FindFirstChild("HumanoidRootPart") then
            local distance = (localPlayerPosition - player.HumanoidRootPart.Position).Magnitude

            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

local InstantReviveWhileEmote = false

function InstantRevive()
local player = game.Players.LocalPlayer
local nearestPlayer = getNearestDownedPlayer()
      if nearestPlayer then
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", nil, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", false, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
      end
end

function InstantReviveNoEmote()
local player = game.Players.LocalPlayer
local nearestPlayer = getNearestDownedPlayer()
      if nearestPlayer then
          if player.Character:GetAttribute("State") == "Run" or player.Character:GetAttribute("State") == "Air" or player.Character:GetAttribute("State") == "Fall" or player.Character:GetAttribute("State") == "Jump" or player.Character:GetAttribute("State") == "Crouch" then
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", nil, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", false, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
         game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", true, tostring(nearestPlayer))
          end
      end
end

local AutoRevive = false
local DelayRevive = 0.1

local Toggle = Tabs.Misc:AddToggle("InsRev", {Title = "Instant Revive", Default = false})

Toggle:OnChanged(function(State)
    AutoRevive = State
  while AutoRevive and wait(DelayRevive) do
     if InstantReviveWhileEmote then
       spawn(InstantRevive)
   else
      spawn(InstantReviveNoEmote)
       end
    end
end)

local Toggle = Tabs.Misc:AddToggle("InsQua", {Title = "Instant Revive While Emote", Default = false})

Toggle:OnChanged(function(State)
    InstantReviveWhileEmote = State
end)

local Slider = Tabs.Misc:AddSlider("ReviveDelay", {
        Title = "Instant Revive Delay",
        Description = "",
        Default = 0.1,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(v)
            DelayRevive = v
        end
    })

function BreakTheDoor()
local args = {
    [1] = math.random(1, 100)
}

game:GetService("ReplicatedStorage").Events.Map.BreakDoor:FireServer(unpack(args))
end

function OpenDoor()
local args = {
    [1] = math.random(1, 100)
}

game:GetService("ReplicatedStorage").Events.Map.UseInteractable:FireServer(unpack(args))
end

local AutoInteractDoor = false

local Toggle = Tabs.Misc:AddToggle("AutoRev", {Title = "Auto Interaction Door", Default = false})

Toggle:OnChanged(function(State)
    AutoInteractDoor = State
    
 while AutoInteractDoor and wait() do
       BreakTheDoor()
  --    OpenDoor()
    end
end)

function DrinkCola()
local ohNumber1 = 0
local ohNumber2 = 13

game:GetService("ReplicatedStorage").Events.Character.ToolAction:FireServer(ohNumber1, ohNumber2)
end

local AutoDrinkCola = false

local Toggle = Tabs.Misc:AddToggle("AutoRev", {Title = "Auto Drink Cola", Default = false})

Toggle:OnChanged(function(State)
    AutoDrinkCola = State
    
 while AutoDrinkCola and wait() do
       DrinkCola()
    end
end)
    
Tabs.Misc:AddParagraph({
        Title = "Adjustment Features",
        Content = " "
    })

local StrafeAcceleration = 184
local StrafeAcceleration2 = 184
local TSpeed = 1500
local TSpeed2 = 1500
local TJump = 3
local TJump2 = 3

function setTSpeed(newSpeed)
    if TSpeed ~= newSpeed then
        TSpeed = newSpeed
        
    local OptimizerGarbageCollection = true
    local gcObjects = getgc(OptimizerGarbageCollection)

pcall(function()
    for i = 1, #gcObjects do
        local v = gcObjects[i]
        if type(v) == "table" and rawget(v, "SprintCap") then
            if v.Speed and v.JumpHeight then
                   rawset(v, "Speed", TSpeed)
                  end
               end
            end
        end)
    end
end

function setTJump(newJump)
    if TJump ~= newJump then
        TJump = newJump
    local OptimizerGarbageCollection = true
    local gcObjects = getgc(OptimizerGarbageCollection)

pcall(function()
    for i = 1, #gcObjects do
        local v = gcObjects[i]
        if type(v) == "table" and rawget(v, "SprintCap") then
           if v.Speed and v.JumpHeight then
                  rawset(v, "JumpHeight", TJump)
                  end
               end
            end
        end)
    end
end

function setStrafeAcceleration(newAcceleration)
    if StrafeAcceleration ~= newAcceleration then
        StrafeAcceleration = newAcceleration
    local OptimizerGarbageCollection = true
    local gcObjects = getgc(OptimizerGarbageCollection)

pcall(function()
    for i = 1, #gcObjects do
        local v = gcObjects[i]
        if type(v) == "table" and rawget(v, "SprintCap") then
            if v.Speed and v.JumpHeight then
                  rawset(v, "AirStrafeAcceleration", StrafeAcceleration)
                  rawset(v, "AirAcceleration", 3)
                  end
               end
            end
        end)
    end
end

local Input = Tabs.Misc:AddInput("PlayerSpeed", {
        Title = "Player Speed",
        Default = "1500",
        Placeholder = "Speed Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            TSpeed2 = tonumber(Value) or 1500
        end
    })
    
local Input = Tabs.Misc:AddInput("PlayerJump", {
        Title = "Player Jump",
        Default = "3",
        Placeholder = "Jump Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            TJump2 = tonumber(Value) or 3
        end
    })
    
local Input = Tabs.Misc:AddInput("PlayerStrafeAcceleration", {
        Title = "Player Strafe Acceleration",
        Default = "184",
        Placeholder = "Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            StrafeAcceleration2 = tonumber(Value) or 184
        end
    })
    
local Input = Tabs.Misc:AddInput("PlayerFOV", {
        Title = "Player FOV",
        Default = "1",
        Placeholder = "Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.PlayerScripts.Camera.FOVAdjusters.Zoom.Value = Value
        end
    })
    
 Tabs.Misc:AddParagraph({
        Title = "Adjustment (2)",
        Content = ""
    })
    
local UseOriginalJump = false
local OriginalJumpPower = 20

local Toggle = Tabs.Misc:AddToggle("PlayerJumpPower", {Title = "Jump Power Toggle", Default = false })

    Toggle:OnChanged(function(State)
        UseOriginalJump = State
     
  while UseOriginalJump and wait(0.1) do
  spawn(function()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:FindFirstChild("Humanoid")
   if not  UseOriginalJump and humanoid then
       humanoid.UseJumpPower = false
       humanoid.JumpPower = 20
     end
     
    if player.Character and humanoid then
          humanoid.UseJumpPower = true
          humanoid.JumpPower = OriginalJumpPower
        end
    end)
end
end)

local Input = Tabs.Misc:AddInput("PlayerJumpPower", {
        Title = "Player Jump Power",
        Default = "20",
        Placeholder = "Jump Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            OriginalJumpPower = tonumber(Value) or 20
        end
    })
    
local CFRAMEWalk = false
local moveDistance = 5

local Toggle = Tabs.Misc:AddToggle("PlayerWalkspeed", {Title = "Walkspeed Toggle", Default = false })

    Toggle:OnChanged(function(State)
        CFRAMEWalk = State
 
 while CFRAMEWalk and wait(0.1) do
local RunService = game:GetService("RunService")
local hb = RunService.Heartbeat
local speaker = game.Players.LocalPlayer
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
local delta = hb:Wait()

     if chr and hum then
             chr:TranslateBy(hum.MoveDirection * moveDistance * delta * 10)
           end
        end
    end)

local Input = Tabs.Misc:AddInput("PlayerWalkCf", {
        Title = "Player Walkspeed",
        Default = "5",
        Placeholder = "Walk Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            moveDistance = tonumber(Value) or 5
        end
    })
    
local BounceToggle = false
local GetSpeedometer
local AdjustedBounce = 80
local AdjustedBounce2 = 120

local Toggle = Tabs.Misc:AddToggle("AdjustBounce", {Title = "Bounce Toggle", Default = false })

    Toggle:OnChanged(function(State)
        BounceToggle = State
     
  while BounceToggle and wait(0.1) do
  spawn(function()
    GetSpeedometer = game:GetService("Players").LocalPlayer.PlayerGui.Shared.HUD.Overlay.Default.CharacterInfo.Item.Speedometer.Players.Text
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:FindFirstChild("Humanoid")
   if not  BounceToggle and humanoid then
       humanoid.WalkSpeed = 0
     end
     
    if player.Character and humanoid then
          humanoid.WalkSpeed = AdjustedBounce
        if player.Character:GetAttribute("State") == "Default" or player.Character:GetAttribute("State") == "Downed" or not BounceToggle then
          humanoid.WalkSpeed = 0
            end
            
        if player.Character:GetAttribute("State") == "Emoting" or player.Character:GetAttribute("State") == "EmotingAir" or player.Character:GetAttribute("State") == "EmoteSlide" or player.Character:GetAttribute("State") == "EmoteSlideAir" then
            humanoid.WalkSpeed = AdjustedBounce2 + GetSpeedometer
        elseif GetSpeedometer == 15 or player.Character:GetAttribute("State") == "Default" then -- anti stunning bug
          humanoid.WalkSpeed = 0
        else
           humanoid.WalkSpeed = AdjustedBounce + GetSpeedometer
           end
        end
    end)
end
    end)

local Input = Tabs.Misc:AddInput("PlayerBounce", {
        Title = "Player Bounce",
        Default = "80",
        Placeholder = "Bounce Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            AdjustedBounce = tonumber(Value) or 80
        end
    })
    
local Input = Tabs.Misc:AddInput("EmoteBounce", {
        Title = "Emote Bounce",
        Default = "120",
        Placeholder = "Bounce Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            AdjustedBounce2 = tonumber(Value) or 120
        end
    })

Tabs.Misc:AddParagraph({
        Title = "Emote Features",
        Content = " "
    })

local FakeEmoteDash = false
local SelectedEmoteSpeed = 2000

local Toggle = Tabs.Misc:AddToggle("EmoteD1", {Title = "Sprint Emote Dash", Default = false })

    Toggle:OnChanged(function(State)
        FakeEmoteDash = State

if FakeEmoteDash == false then
  setTSpeed(TSpeed2)
end

while FakeEmoteDash and wait(0.1) do
local char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
    if char and char:GetAttribute("State") == "Emoting" or char:GetAttribute("State") == "EmotingAir" or char:GetAttribute("State") == "EmotingSlide" or char:GetAttribute("State") == "EmotingSlideAir" then
          wait(1)
      setTSpeed(SelectedEmoteSpeed)
  else
      setTSpeed(TSpeed2)
         end
     end
end)

  local Input = Tabs.Misc:AddInput("EmoteSpeed", {
        Title = "Emote Speed",
        Default = "2000",
        Placeholder = "Emote Speed Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            SelectedEmoteSpeed = tonumber(Value) or 2000
        end
    })
    
local PremiumUser = {"yzuicy", "nmivvr", "TinyCatFangs", "kittigifs", "SaidTheSky2", "Befxujx", "hgiecusx", "6feix"}
local OwnerUser = {"Guilfordy_sagalol", "Peleeelallee", "Unknownproooolucky", "Leorozon", "johnsam6"}

if table.find(PremiumUser, game.Players.LocalPlayer.Name) or table.find(OwnerUser, game.Players.LocalPlayer.Name) then
 Tabs.Misc:AddParagraph({
        Title = "Perks Features",
        Content = "REQUIREMENTS: U need to buy Headphones to Equip Multiple Perks"
    })
    
local SelectedPerks = "Briefcase"
local LayoutPerkNumber = 3
local HttpService = game:GetService("HttpService")

    
function EquipMultiplePerks(Number)
local ObfRemote = HttpService:JSONEncode({
    Number = tostring(1),
    Mode = "Stop Stealing Kiddo",
})

game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(1), "Perk1")
wait(0.1)

local ObfRemote2 = HttpService:JSONEncode({
    Number = tostring(Number),
    Mode = "Stop Stealing Kiddo",
})
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote2)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(Number), 1)
end

local Dropdown = Tabs.Misc:AddDropdown("SelectedPerks", {
        Title = "Select A Perk",
        Values = {"Briefcase", "Headphones", "Stethoscope", "Badge", "Bloxy Boy", "Medkit", "Stilts", "Mil-Grade Pack", "Hermes Shoes", "Spring Shoes", "Threads", "Boost Pack"},
        Multi = false,
        Default = 1,
    })

    Dropdown:OnChanged(function(Value)
        SelectedPerks = Value

if SelectedPerks == "Briefcase" then
LayoutPerkNumber = 3
elseif SelectedPerks == "Stethoscope" then
LayoutPerkNumber = 2
elseif SelectedPerks == "Headphones" then
LayoutPerkNumber = 1
elseif SelectedPerks == "Badge" then
LayoutPerkNumber = 7
elseif SelectedPerks == "Bloxy Boy" then
LayoutPerkNumber = 4
elseif SelectedPerks == "Medkit" then
LayoutPerkNumber = 6
elseif SelectedPerks == "Stilts" then
LayoutPerkNumber = 5
elseif SelectedPerks == "Mil-Grade Pack" then
LayoutPerkNumber = 8
elseif SelectedPerks == "Hermes Shoes" then
LayoutPerkNumber = 9
elseif SelectedPerks == "Spring Shoes" then
LayoutPerkNumber = 10
elseif SelectedPerks == "Threads" then
LayoutPerkNumber = 696
elseif SelectedPerks == "Boost Pack" then
LayoutPerkNumber = 11
 end
    end)

local EquipMultiplePerksTG = false

local Toggle = Tabs.Misc:AddToggle("TGEquipPerksMulti", {Title = "Equip Multiple Perks", Default = false})

Toggle:OnChanged(function(State)
    EquipMultiplePerksTG = State
 
 while EquipMultiplePerksTG and wait(0.1) do
       EquipMultiplePerks(LayoutPerkNumber)
    end
end)

function EquipAllPerks()
local ObfRemote = HttpService:JSONEncode({
    Number = tostring(2),
    Mode = "Stop Stealing Kiddo",
})
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(2), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(3), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(4), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(5), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(6), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(7), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(8), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(9), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(10), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(11), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(tostring(696), "Perk1")
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
end

function UnequipAllPerks()
local ObfRemote = HttpService:JSONEncode({
    Number = "Unequip",
    Mode = "Stop Stealing Kiddo"
})
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 2)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 3)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 4)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 5)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 6)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 7)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 8)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 9)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 10)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 11)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer("Unequip", 696)
game:GetService("ReplicatedStorage").Events.Data.Equip:FireServer(ObfRemote)
end

Tabs.Misc:AddButton({
        Title = "Equip All Perks",
        Description = " ",
        Callback = function()
        EquipAllPerks()
  end
})

Tabs.Misc:AddButton({
        Title = "Unequip All Perks",
        Description = " ",
        Callback = function()
        UnequipAllPerks()
  end
})

else

Tabs.Misc:AddParagraph({
        Title = "Perks Features",
        Content = "(PREMIUM USER ONLY)\nGo to Discord Server if you want to buy"
    })

end

Tabs.Misc:AddParagraph({
        Title = "Lag Switch Features",
        Content = " "
    })
    
    
    
local LagDelay = 0.1
    
 local CAS = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")

local Keybind = Tabs.Misc:AddKeybind("KeyLag", {
        Title = "Keybind to Lag",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "R",
        
        Callback = function(Bool)
        if Bool then
        setfflag("TaskSchedulerTargetFps", "1")
      wait(LagDelay)
          setfflag("TaskSchedulerTargetFps", "900")
        end
   end,

        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })
 
 function CreateBindableButton()
    local function Action(actionName, inputState)
      if inputState == Enum.UserInputState.Begin then
          setfflag("TaskSchedulerTargetFps", "1")
      wait(LagDelay)
          setfflag("TaskSchedulerTargetFps", "900")
        end
    end

    CAS:BindAction("ButtonTarget", Action, true, Enum.KeyCode.E)

    local button1 = CAS:GetButton("ButtonTarget")
    if button1 then 
        CAS:SetPosition("ButtonTarget", UDim2.new(0, 0, 0.5, 0))
        CAS:SetTitle("ButtonTarget", "Start Lag")
        CAS:SetImage("ButtonTarget", "IMAGEHERE")  -- Replace "IMAGEHERE" with the actual image ID
        button1.Size = UDim2.new(0.3, 0, 0.3, 0) -- Set size if button exists
    end
    
    MakeDraggable(button1, button1)
end

function RemoveBindableButton()
    CAS:UnbindAction("ButtonTarget")
end

local Toggle = Tabs.Misc:AddToggle("LagSwitch", {Title = "Lag Switch Toggle", Default = false})

Toggle:OnChanged(function(State)
    if State then
        CreateBindableButton() -- Create buttons when toggled on
    else
        RemoveBindableButton() -- Remove buttons when toggled off
    end
end)

local Slider = Tabs.Misc:AddSlider("LagDelay", {
        Title = "Lag Delay",
        Description = "",
        Default = 0.1,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(v)
            LagDelay = v
        end
    })

Tabs.Misc:AddParagraph({
        Title = "BHOP Features",
        Content = " "
    })
    
local Keybind = Tabs.Misc:AddKeybind("KeyBHOP", {
        Title = "Keybind to BHOP",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "B",
        
        Callback = function(Bool)
        BHopKey = Bool
          spawn(function()
            while true and wait(0.1) do
                if BHopKey then 
                 setfflag("MaxAltitudePDStickHipHeightPercent", "-24")
             else
                 setfflag("MaxAltitudePDStickHipHeightPercent", "10")
                end
           end
       end)
   end,

        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })
    --
local BHop = false
local BHOPGuiSize = 75
local delay = 1

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local BHop2 = false

local function createtoggle()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.CoreGui
    screenGui.Name = "BHopToggle"
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, BHOPGuiSize, 0, BHOPGuiSize)
    frame.Position = UDim2.new(1, -120, 0.5, -50)
    frame.BackgroundColor3 = Color3.new(1, 1, 1)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0
    frame.Parent = screenGui
    frame.Active = true
    frame.Draggable = true
    frame.ClipsDescendants = true
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(1, 0)
    uiCorner.Parent = frame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
    toggleButton.BorderSizePixel = 0
    toggleButton.TextColor3 = Color3.new(0, 0, 0)
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 14
    toggleButton.Text = "Auto Jump: OFF"
    toggleButton.Parent = frame
    
    toggleButton.MouseButton1Click:Connect(function()
        BHop2 = not BHop2
        toggleButton.Text = BHop2 and "Auto Jump: ON" or "Auto Jump: OFF"
    end)
    
    MakeDraggable(toggleButton, frame)
end

-- Auto-Jump
spawn(function()
while true and wait(0.1) do
    if BHop2 then
      setfflag("MaxAltitudePDStickHipHeightPercent", "-24")
      else
      setfflag("MaxAltitudePDStickHipHeightPercent", "10")
       end
    end
end)

local Players = game:GetService("Players")

local function onPlayerRemoving()
setfflag("MaxAltitudePDStickHipHeightPercent", "10")
end

Players.PlayerRemoving:Connect(onPlayerRemoving)

function destroytoggle()
local target = game.CoreGui

if target:FindFirstChild("BHopToggle") then
target.BHopToggle:Destroy()
end
end

local Toggle = Tabs.Misc:AddToggle("BHOPToggle", {Title = "BHOP Toggle", Default = false })

    Toggle:OnChanged(function(State)
 BHop = State
if BHop then
createtoggle()
else
destroytoggle()
end
end)

local Input = Tabs.Misc:AddInput("GuiSize", {
        Title = "BHOP Gui Size",
        Default = "75",
        Placeholder = "Size Number",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            BHOPGuiSize = tonumber(Value) or 75
        end
    })

Tabs.Misc:AddParagraph({
        Title = "Lightning Modifier",
        Content = " "
    })

local Lighting = game:GetService("Lighting")
local normalambient = Lighting.Ambient
local normalcolorshift = Lighting.ColorShift_Bottom
local normalcolorshift2 = Lighting.ColorShift_Top
local normalfog1 = Lighting.FogEnd
local normalfog2 = Lighting.FogStart
local normalGlobalshadow = Lighting.GlobalShadows
local normalclock = Lighting.ClockTime
local normalbrightness = Lighting.Brightness

function fb()
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
            Lighting.ColorShift_Top = Color3.new(1, 1, 1)
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
            Lighting.GlobalShadows = false
            Lighting.ClockTime = 14
            Lighting.Brightness = 2
end

function nofb()
            Lighting.Ambient = normalambient
            Lighting.ColorShift_Bottom = normalcolorshift
            Lighting.ColorShift_Top = normalcolorshift2
            Lighting.FogEnd = normalfog1
            Lighting.FogStart = normalfog2
            Lighting.GlobalShadows = normalGlobalshadow
            Lighting.ClockTime = normalclock
            Lighting.Brightness = normalbrightness
end

local Fullbrighting = false
 
 local Toggle = Tabs.Misc:AddToggle("FullBright", {Title = "Full Bright", Default = false })

    Toggle:OnChanged(function(StateFB)
 Fullbrighting = StateFB
     if Fullbrighting then
          fb()
       else
          nofb()
       end
end)

Options.FullBright:SetValue(false)

Tabs.Misc:AddParagraph({
        Title = "Fps Booster and Anti-Lags",
        Content = " "
    })

local Lag1 = false

local Toggle = Tabs.Misc:AddToggle("Anti_Lag1", {Title = "Anti Lag 1", Default = false })

    Toggle:OnChanged(function(Value1)
        Lag1 = Value1
if Lag1 then
for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end
    end)

Options.Anti_Lag1:SetValue(false)

local Toggle = Tabs.Misc:AddToggle("Anti_Lag2", {Title = "Anti Lag 2", Default = false })

    Toggle:OnChanged(function(Value3)
        if Value3 then
        local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
wait(1)
for i,v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
        v.Material = "Plastic"
v.Reflectance = 0
elseif v:IsA("Decal") and decalsyeeted then 
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then 
v.Lifetime = NumberRange.new(0)
    end
end
end
    end)

Options.Anti_Lag2:SetValue(false)

local Toggle = Tabs.Misc:AddToggle("Anti_Lag3", {Title = "Anti Lag 3", Default = false })

    Toggle:OnChanged(function(Value4)
        if Value4 then
        local decalsyeeted = true 
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
sethiddenproperty(l,"Technology",2)
sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = 0
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(w:GetDescendants()) do
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted  then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.Graphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end
for i = 1,#l:GetChildren() do
    e=l:GetChildren()[i]
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
w.DescendantAdded:Connect(function(v)
    wait(1)--prevent errors and shit
   if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.ShirtGraphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
                 end
             end)
         end
    end)

Options.Anti_Lag3:SetValue(false)

Tabs.Misc:AddButton({
        Title = "Accurate Low Quality",
        Description = "(FastFlag)",
        Callback = function()
        -- made by guesttester_1 (pls credit to me)
-- i forgot to add remove textures script

setfpscap(900) -- normal fps cap for other executors

setfflag("TaskSchedulerTargetFps", "900") -- for setfpscap unc missing or unsupported for executors

local function removeWater()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Terrain") then
            obj.WaterTransparency = 1
            obj.WaterWaveSize = 0
            obj.WaterWaveSpeed = 0
            obj.WaterReflectance = 0
        end
    end
end

local function removeReflections()
    local lighting = game:GetService("Lighting")
    lighting.EnvironmentSpecularScale = 0
    lighting.EnvironmentDiffuseScale = 0
end

local function removeEffects()
    for _, effect in pairs(workspace:GetDescendants()) do
        if effect:IsA("ParticleEmitter") or effect:IsA("Smoke") or effect:IsA("Fire") or effect:IsA("Sparkles") then
            effect.Enabled = false
        end
    end
end

local function removeGrass()
setfflag("FRMMinGrassDistance", "0")
setfflag("FRMMaxGrassDistance", "0")
setfflag("RenderGrassDetailStrands", "0")
end

local function removeExplosions()
    for _, explosion in pairs(workspace:GetDescendants()) do
        if explosion:IsA("Explosion") then
            explosion:Destroy()
        end
    end
end

local function setLowShadows()
    game.Lighting.Technology = Enum.Technology.Voxel
    game.Lighting.GlobalShadows = false
end

local function setLowQuality()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

local function setFlagsGraphics()
setfflag("DebugGraphicsDisableDirect3D11", "true")
setfflag("DebugGraphicsPreferVulkan", "true")
setfflag("DebugTextureManagerSkipMips", "2")
setfflag("TaskSchedulerLimitTargetFpsTo2402", "false")
setfflag("TaskSchedulerTargetFps", "900")
end

local function reduceLag()
    removeWater()
    removeReflections()
--    removeEffects()
--    removeExplosions()
    setLowShadows()
    setLowQuality()
    setFlagsGraphics()
    removeGrass()
end

reduceLag()

workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("Terrain") then
      wait(0.5)
        reduceLag()
     end
end)

        end
 })

-- Settings

Tabs.Settings:AddParagraph({
        Title = "Save Config",
        Content = " "
    })

Tabs.Settings:AddButton({
        Title = "Remove FPS Counter",
        Description = "(TEMPORARY)",
        Callback = function()
            fpsCounter:Destroy()
        end
    })

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:SetIgnoreIndexes({})

-- Save Folder
InterfaceManager:SetFolder("UnknownHubXUniversal")
SaveManager:SetFolder("UnknownHubXUniversal/Evade")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

-- Auto Load Configuration
SaveManager:LoadAutoloadConfig()

local function optimizegetgc()
    local OptimizerGarbageCollection = true
    local gcObjects = getgc(OptimizerGarbageCollection)

pcall(function()
    for i = 1, #gcObjects do
        local v = gcObjects[i]
        if type(v) == "table" and rawget(v, "SprintCap") then
           if v.Speed and v.JumpHeight then
                  rawset(v, "Speed", TSpeed)
                  rawset(v, "JumpHeight", TJump)
                  rawset(v, "AirStrafeAcceleration", StrafeAcceleration)
                  rawset(v, "AirAcceleration", 3)
                  end
             end
        end
    end)
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
      wait(5)
      optimizegetgc()
      wait(10)
      optimizegetgc()
end)

if game.Players.LocalPlayer.Character then
    optimizegetgc()
end

spawn(function()
while wait(3) do
if not FakeEmoteDash then
setStrafeAcceleration(StrafeAcceleration2)
setTSpeed(TSpeed2)
setTJump(TJump2)
     end
   end
end)
