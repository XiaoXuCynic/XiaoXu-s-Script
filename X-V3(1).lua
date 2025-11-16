local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/dashabi888/jsbskzb/refs/heads/main/UI')))()
local window = library:new("XXX")

local X = window:Tab("通用","125444132016348")
local about = X:section("面板", true)

about:Slider("速度", "Slider", 16, 16, 1000, false, function(Value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
end)

about:Slider("跳跃", "Slider", 50, 50, 1000, false, function(Value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
end)

about:Slider("重力", "Slider", 198, 198, 1000, false, function(Value)
    game.Workspace.Gravity = Value
end)

about:Slider("高度", "Slider", 2, 2, 999,false, function(Value)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
    end
end)

about:Slider("相机焦距上限", "Slider",  128, 128, 1000, false, function(Value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)

about:Slider("相机焦距", "Slider", 70, 70, 1000, false, function(v)
    game.Workspace.CurrentCamera.FieldOfView = v
end)

local X = window:Tab("活到7天","125444132016348")
local about = X:section("面板", true)

local ESPName = {
    "ScpESPFloder",
    "AnimalESPFloder",
}
for _,v in next,ESPName do
    if not workspace:FindFirstChild(v) then
        local ESPFloder = Instance.new("Folder")
        ESPFloder.Parent = workspace
        ESPFloder.Name = v
    end
end

local function ESPMonster(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.ScpESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local function ESPAnimal(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.AnimalESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end

local OAO = game.Players.LocalPlayer
local QWQ = game.ReplicatedStorage
local OvO = {
    instantlycutofftree = false,
    AutoCollectScraps = false,
    AutoCollectDirt = false,
    AutoCollectHarvt = false,
    KillAll = false,
    KillAura = false,
    AutoTpPine = false,
    AutoHeli = false,
    AutoCast = false
}

local function findClosestPine()
    local closestPine = nil
    local shortestDistance = math.huge
    if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
        for _, v in next, workspace.trees:GetChildren() do
            if v.Name:find("Pine") and v.PrimaryPart then
                local distance = (v.PrimaryPart.Position - OAO.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    closestPine = v
                    shortestDistance = distance
                end
            end
        end
    end
    return closestPine
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local animalConnection
local scpConnection

about:Toggle("动物透视", "", false, function(state)
    if state then
        if animalConnection then animalConnection:Disconnect() end
        for _, v in next, workspace.animals:GetChildren() do
            ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
        end
        animalConnection = workspace.animals.ChildAdded:Connect(function(v)
            ESPAnimal(v.Name, v, Color3.new(1, 0, 0))
        end)
    else
        if animalConnection then animalConnection:Disconnect() end
        if workspace:FindFirstChild("AnimalESPFloder") then
            workspace.AnimalESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("怪物透视", "", false, function(state)
    if state then
        if scpConnection then scpConnection:Disconnect() end
        for _, v in next, workspace.scps:GetChildren() do
            ESPMonster("怪物", v, Color3.new(0, 0, 1))
        end
        scpConnection = workspace.scps.ChildAdded:Connect(function(v)
            ESPMonster("怪物", v, Color3.new(0, 0, 1))
        end)
    else
        if scpConnection then scpConnection:Disconnect() end
        if workspace:FindFirstChild("ScpESPFloder") then
            workspace.ScpESPFloder:ClearAllChildren()
        end
    end
end)

about:Toggle("秒砍树", "", false, function(state)
    OvO.instantlycutofftree = state
    if state then
        spawn(function()
            while OvO.instantlycutofftree do 
                task.wait()
                QWQ.remotes.swing_axe:FireServer()
                for _,v in next,workspace.logs:GetChildren() do
                    if v.Name == "log" and v:FindFirstChild("main") and v.main:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.main.ProximityPrompt)
                    end
                end
            end
        end)
    end
end)

about:Toggle("自动钓鱼", "", false, function(state)
    OvO.AutoCast = state
    if state then
        spawn(function()
            while OvO.AutoCast do 
                task.wait()
                game:GetService("ReplicatedStorage").remotes.cast:FireServer()
                task.wait(0.2)
                for i = 1,8 do
                    game:GetService("ReplicatedStorage").remotes.hit_fish:FireServer()
                end
            end
        end)
    end
end)

about:Button("秒吃食物",function()
    if OAO.Character and OAO.Character:FindFirstChild("hunger") and OAO.Character.hunger.Value < 30 then
        for _,v in pairs(OAO.Backpack:GetChildren()) do
            if v:FindFirstChild("eat") then
                for i = 1, 20 do
                    v.Parent = OAO.Character
                    OAO.Character[v.Name].eat:FireServer()
                end
            end
        end
    end
end)

about:Toggle("自动收集材料", "", false, function(state)
    OvO.AutoCollectScraps = state
    if state then
        spawn(function()
            while OvO.AutoCollectScraps do 
                task.wait()
                if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                    local oldcf = OAO.Character.HumanoidRootPart.CFrame
                    for _, v in pairs(workspace.scraps:GetChildren()) do
                        local material = v:FindFirstChild("defaultMaterial10")
                        if material and OvO.AutoCollectScraps then
                            local prompt = material:FindFirstChild("ProximityPrompt")
                            if prompt and OvO.AutoCollectScraps then
                                OAO.Character.HumanoidRootPart.CFrame = material.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2)
                                fireproximityprompt(prompt)
                                task.wait(0.2) 
                                OAO.Character.HumanoidRootPart.CFrame = oldcf
                            end
                        end
                    end
                end
            end
        end)
    end
end)

about:Button("传送回出生点", function()
    if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
        OAO.Character.HumanoidRootPart.CFrame = CFrame.new(57,42,416)
    end
end)

about:Toggle("自动收集成熟品", "", false, function(state)
    OvO.AutoCollectHarvt = state
    if state then
        spawn(function()
            local oldpos
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                oldpos = OAO.Character.HumanoidRootPart.CFrame
            end
            while OvO.AutoCollectHarvt do 
                task.wait()
                if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                    for _,v in next,workspace.harvest:GetChildren() do
                        if v:FindFirstChild("main") then
                            OAO.Character.HumanoidRootPart.CFrame = v.main.CFrame
                            fireproximityprompt(v.main.ProximityPrompt)
                        end
                    end
                end
            end
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") and oldpos then
                OAO.Character.HumanoidRootPart.CFrame = oldpos
            end
        end)
    end
end)

about:Toggle("自动收集生鹿肉", "", false, function(state)
    OvO.AutoCollectHarvt = state
    if state then
        spawn(function()
            local oldpos
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                oldpos = OAO.Character.HumanoidRootPart.CFrame
            end
            while OvO.AutoCollectHarvt do 
                task.wait()
                if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                    for _,v in next,workspace.interact:GetChildren() do
                        if v.Name == "deer" and v:FindFirstChild("lungs,heart,intestines") then
                            OAO.Character.HumanoidRootPart.CFrame = v["lungs,heart,intestines"].CFrame
                            fireproximityprompt(v["lungs,heart,intestines"].ProximityPrompt)
                        end
                    end
                end
            end
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") and oldpos then
                OAO.Character.HumanoidRootPart.CFrame = oldpos
            end
        end)
    end
end)

about:Toggle("自动收集包菜", "", false, function(state)
    OvO.AutoCollectDirt = state
    if state then
        spawn(function()
            local oldpos
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                oldpos = OAO.Character.HumanoidRootPart.CFrame
            end
            while OvO.AutoCollectDirt do 
                task.wait()
                if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                    if workspace.builds and workspace.builds["Cabbage Farm"] and workspace.builds["Cabbage Farm"]:FindFirstChild("dirt") then
                        OAO.Character.HumanoidRootPart.CFrame = workspace.builds["Cabbage Farm"].dirt.CFrame
                        fireproximityprompt(workspace.builds["Cabbage Farm"].dirt.ProximityPrompt)
                    end
                end
            end
            if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") and oldpos then
                OAO.Character.HumanoidRootPart.CFrame = oldpos
            end
        end)
    end
end)

about:Toggle("枪械光环", "", false, function(state)
    OvO.KillAll = state
    if state then
        spawn(function()
            while OvO.KillAll do 
                task.wait()
                for _,v in next,workspace.scps:GetChildren() do
                    if v:FindFirstChild("HumanoidRootPart") then
                        local args = {
                            [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                        }
                        game:GetService("ReplicatedStorage").remotes.shoot:FireServer(unpack(args))
                        game:GetService("ReplicatedStorage").remotes.reload:FireServer()
                    end
                end
                for _,v in next,workspace.animals:GetChildren() do
                    if v:FindFirstChild("HumanoidRootPart") then
                        local args = {
                            [1] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                            [2] = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z) * CFrame.Angles(0, 0, 0),
                        }
                        game:GetService("ReplicatedStorage").remotes.shoot:FireServer(unpack(args))
                        game:GetService("ReplicatedStorage").remotes.reload:FireServer()
                    end
                end
            end
        end)
    end
end)

about:Toggle("子弹追踪(锁头)", "", false, function(state)
    OvO.KillAura = state
    if state then
        spawn(function()
            while OvO.KillAura do 
                task.wait()
                if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                    for _, scp in ipairs(workspace.scps:GetChildren()) do
                        local HitPart = scp:FindFirstChild("HumanoidRootPart") or scp:FindFirstChild("Head")
                        if HitPart and scp:FindFirstChildWhichIsA("Humanoid") and scp.Humanoid.Health > 0 then
                            game.ReplicatedStorage.remotes.shoot:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                        end
                    end
                    for _, animal in ipairs(workspace.animals:GetChildren()) do
                        local HitPart = animal:FindFirstChild("HumanoidRootPart") or animal:FindFirstChild("Head")
                        if HitPart and animal:FindFirstChildWhichIsA("Humanoid") and animal.Humanoid.Health > 0 then
                            game.ReplicatedStorage.remotes.shoot:FireServer(HitPart.CFrame + Vector3.new(0, 0.5, 0), HitPart.CFrame)
                        end
                    end
                end
            end
        end)
    end
end)

about:Toggle("自动传送最近的木头", "", false, function(state)
    OvO.AutoTpPine = state
    if state then
        spawn(function()
            while OvO.AutoTpPine do 
                task.wait()
                if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
                    local closestPine = findClosestPine()
                    if closestPine then
                        local targetPosition = closestPine.PrimaryPart.Position
                        OAO.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(targetPosition.X, targetPosition.Y - 30, targetPosition.Z))
                        OAO.Character.HumanoidRootPart.Anchored = OvO.AutoTpPine
                    end
                end
            end
        end)
    else
        if OAO.Character and OAO.Character:FindFirstChild("HumanoidRootPart") then
            OAO.Character.HumanoidRootPart.Anchored = false
        end
    end
end)

about:Toggle("开启无限模式", "", false, function(state)
    if workspace:FindFirstChild("infinite") then
        workspace.infinite.Value = state
    end
end)

about:Toggle("开启雨天", "", false, function(state)
    if workspace:FindFirstChild("raining") then
        workspace.raining.Value = state
    end
end)

about:Toggle("当前天数和手表时间", "", false, function(state)
    if state then
        if workspace:FindFirstChild("current_day") and workspace:FindFirstChild("waited") then
            -- 注意：这里需要确认 txtf 函数是否存在
            if type(txtf) == "function" then
                txtf("UpdateLine", "Left", "当前天数"..workspace.current_day.Value)
                txtf("UpdateLine", "Left", "当前时间"..workspace.waited.Value)
            end
        end
    else
        if type(txtf) == "function" then
            txtf("ClearText")
        end
    end
end)

about:Toggle("自动拾取飞机残骸", "", false, function(state)
    OvO.AutoHeli = state
    if state then
        spawn(function()
            while OvO.AutoHeli do 
                task.wait()
                for _,v in next,workspace.interact:GetChildren() do
                    if v.Name == "heli" and v:FindFirstChild("Body") and v.Body:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.Body.ProximityPrompt)
                    end
                end
            end
        end)
    end
end)

local X = window:Tab("战争大亨","125444132016348")
local about = X:section("面板", true)

about:Button("传送回基地", function()
    function getTycoon()
        if game.Players.LocalPlayer.Character and workspace.Tycoon and workspace.Tycoon.Tycoons and game.Players.LocalPlayer.leaderstats and game.Players.LocalPlayer.leaderstats.Team then
            local teamValue = game.Players.LocalPlayer.leaderstats.Team.Value
            if workspace.Tycoon.Tycoons[teamValue] and workspace.Tycoon.Tycoons[teamValue].Essentials and workspace.Tycoon.Tycoons[teamValue].Essentials.Spawn then
                game:GetService("Players").LocalPlayer.Character:MoveTo(workspace.Tycoon.Tycoons[teamValue].Essentials.Spawn.Position)
            end
        end
    end
    getTycoon()
end)

about:Button("传送空投", function()
    local Folder = workspace["Game Systems"]
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") and Folder then
        for _, Child in ipairs(Folder:GetDescendants()) do
            if Child.Name:match("Airdrop_") and Child:FindFirstChild("MainPart") then 
                player.HumanoidRootPart.CFrame = Child.MainPart.CFrame
            end
        end
    end
end)

about:Button("传送旗帜", function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(73.22032928466797, 47.9999885559082, 191.06993103027344)
    end
end)

about:Button("传送油桶1", function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9.748652458190918, 48.662540435791016, 700.2245483398438)
    end
end)

about:Button("传送油桶2", function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(76.48243713378906, 105.25657653808594, -2062.3896484375)
    end
end)

about:Button("传送油桶3", function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28.840208053588867, 49.34040069580078, -416.9921569824219)
    end
end)

about:Button("传送油桶4", function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(69.48390197753906, 105.25657653808594, 3434.9033203125)
    end
end)

about:Button("范围", function()
    _G.HeadSize = 20
    _G.Disabled = true

    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
[file content end]