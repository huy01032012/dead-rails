-- Tạo Giao Diện (GUI) trên màn hình
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MainBorder = Instance.new("UIStroke") -- Viền hồng cho Menu chính
local TitleBar = Instance.new("Frame") -- Thanh tiêu đề chứa logo và tên
local LogoFrame = Instance.new("ImageLabel") -- Ô chứa Logo
local LogoBorder = Instance.new("UIStroke") -- Viền hồng cho Logo
local Title = Instance.new("TextLabel")
local ToggleUiBtn = Instance.new("TextButton") -- Nút ẩn/hiện UI
local BtnToggleBorder = Instance.new("UIStroke") -- Viền hồng cho nút ẩn/hiện
local ButtonContainer = Instance.new("Frame") -- Khung chứa các nút tính năng
local UIListLayout = Instance.new("UIListLayout")

-- Cấu hình hiển thị cho Menu chính
ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "DeadRailsHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) 
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0) 
MainFrame.Size = UDim2.new(0, 220, 0, 385)
MainFrame.Active = true
MainFrame.Draggable = true 

-- THÊM VIỀN MÀU HỒNG CHO MENU CHÍNH
MainBorder.Parent = MainFrame
MainBorder.Color = Color3.fromRGB(255, 105, 180) -- Màu hồng Neon (Hot Pink)
MainBorder.Thickness = 2 
MainBorder.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- KHUNG THANH TIÊU ĐỀ MÀU HỒNG
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

-- TỰ ĐỘNG BO TRÒN LOGO
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0) -- Tạo thành hình tròn hoàn hảo
logoCorner.Parent = LogoFrame

-- LOGO ĐÃ ĐƯỢC THAY THÀNH ẢNH BẠN GỬI
LogoFrame.Name = "Logo"
LogoFrame.Parent = TitleBar
LogoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LogoFrame.Position = UDim2.new(0, 8, 0, 5)
LogoFrame.Size = UDim2.new(0, 30, 0, 30)
-- Đã đổi sang đúng ID hình ảnh cô gái tóc dài của bạn gửi
LogoFrame.Image = "rbxassetid://14022448375" 
LogoFrame.ScaleType = Enum.ScaleType.Crop -- Cắt ảnh vừa vặn với khung tròn cho đẹp

-- VIỀN MÀU HỒNG CHO LOGO TRÒN
LogoBorder.Parent = LogoFrame
LogoBorder.Color = Color3.fromRGB(255, 105, 180)
LogoBorder.Thickness = 1.5

-- TÊN SCRIPT MÀU ĐEN 
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 45, 0, 0)
Title.Size = UDim2.new(1, -85, 1, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "DEADRAILS HUB"
Title.TextColor3 = Color3.fromRGB(0, 0, 0) 
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- NÚT ẨN / HIỆN GIAO DIỆN 
ToggleUiBtn.Parent = TitleBar
ToggleUiBtn.Size = UDim2.new(0, 30, 0, 30)
ToggleUiBtn.Position = UDim2.new(1, -35, 0, 5)
ToggleUiBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ToggleUiBtn.Font = Enum.Font.SourceSansBold
ToggleUiBtn.Text = "_" 
ToggleUiBtn.TextColor3 = Color3.fromRGB(255, 105, 180) 
ToggleUiBtn.TextSize = 18
ToggleUiBtn.ZIndex = 5

-- THÊM VIỀN MÀU HỒNG CHO NÚT ẨN/HIỆN
BtnToggleBorder.Parent = ToggleUiBtn
BtnToggleBorder.Color = Color3.fromRGB(255, 105, 180)
BtnToggleBorder.Thickness = 1.5

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = ToggleUiBtn

-- Khung chứa các nút tính năng
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0, 0, 0, 45)
ButtonContainer.Size = UDim2.new(1, 0, 1, -45)

-- Xếp các nút thẳng hàng
UIListLayout.Parent = ButtonContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Xử lý ẩn hiện
local uiHidden = false
ToggleUiBtn.MouseButton1Click:Connect(function()
    uiHidden = not uiHidden
    if uiHidden then
        ButtonContainer.Visible = false
        MainFrame.Size = UDim2.new(0, 220, 0, 40) 
        ToggleUiBtn.Text = "+" 
    else
        ButtonContainer.Visible = true
        MainFrame.Size = UDim2.new(0, 220, 0, 385) 
        ToggleUiBtn.Text = "_" 
    end
end)

---------------------------------------------------------
-- CÁC BIẾN TRẠNG THÁI
---------------------------------------------------------
local AutoFarm = false
local Aimbot = false
local FullBright = false
local StructureESP = false

-- Hàm tạo nút Bật/Tắt thông thường (Chữ trắng)
local function createButton(text, callback)
    local button = Instance.new("TextButton")
    button.Parent = ButtonContainer
    button.Size = UDim2.new(0.9, 0, 0, 35)
    button.BackgroundColor3 = Color3.fromRGB(180, 50, 50) 
    button.Font = Enum.Font.SourceSansBold
    button.Text = text .. " [OFF]"
    button.TextColor3 = Color3.fromRGB(255, 255, 255) 
    button.TextSize = 14
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    local state = false
    button.MouseButton1Click:Connect(function()
        state = not state
        if state then
            button.BackgroundColor3 = Color3.fromRGB(50, 180, 50) 
            button.Text = text .. " [ON]"
        else
            button.BackgroundColor3 = Color3.fromRGB(180, 50, 50) 
            button.Text = text .. " [OFF]"
        end
        callback(state)
    end)
end

---------------------------------------------------------
-- CÀI ĐẶT CÁC TÍNH NĂNG CHÍNH
---------------------------------------------------------

-- 1. Nút Auto Farm Bones
createButton("Auto Farm Bones", function(on)
    AutoFarm = on
    if AutoFarm then
        task.spawn(function()
            while AutoFarm do
                task.wait(0.5)
                local itemsFolder = workspace:FindFirstChild("Items") or workspace:FindFirstChild("Bones") or workspace:FindFirstChild("DroppedItems")
                if itemsFolder then
                    for _, item in pairs(itemsFolder:GetChildren()) do
                        if not AutoFarm then break end
                        local player = game.Players.LocalPlayer
                        local character = player.Character
                        local root = character and character:FindFirstChild("HumanoidRootPart")
                        if root and (item:IsA("BasePart") or item:IsA("Model")) then
                            local targetPart = item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildOfClass("Part")) or item
                            if targetPart then
                                root.CFrame = targetPart.CFrame + Vector3.new(0, 2, 0)
                                task.wait(0.15)
                                local prompt = item:FindFirstChildOfClass("ProximityPrompt") or item:FindFirstChildWhichIsA("ProximityPrompt", true)
                                if prompt then fireproximityprompt(prompt) end
                                task.wait(0.2)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

-- 2. Nút Aimbot Bắn Đầu
createButton("Aimbot Headshot", function(on)
    Aimbot = on
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    local function getClosestEnemy()
        local closestPlayer = nil
        local shortestDistance = math.huge
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return nil end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and (player.Team ~= LocalPlayer.Team or player.Team == nil) then
                local char = player.Character
                if char then
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    local head = char:FindFirstChild("Head")
                    if humanoid and humanoid.Health > 0 and head then
                        local distance = (myRoot.Position - head.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
        return closestPlayer
    end

    task.spawn(function()
        while Aimbot do
            task.wait()
            local enemy = getClosestEnemy()
            if enemy and enemy.Character and enemy.Character:FindFirstChild("Head") then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, enemy.Character.Head.Position)
            end
        end
    end)
end)

-- 3. Nút Nhìn Trong Đêm
createButton("Full Brightness", function(on)
    FullBright = on
    local Lighting = game:GetService("Lighting")
    if FullBright then
        task.spawn(function()
            while FullBright do
                Lighting.Brightness = 4
                Lighting.ClockTime = 12
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                task.wait(1)
            end
        end)
    else
        Lighting.Brightness = 1
        Lighting.ClockTime = 0
        Lighting.FogEnd = 1000
        Lighting.GlobalShadows = true
    end
end)

-- 4. Nút Định Vị Công Trình
createButton("Structure ESP", function(on)
    StructureESP = on
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    if StructureESP then
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Model") and obj.Name ~= LocalPlayer.Name and not Players:GetPlayerFromCharacter(obj) then
                local mainPart = obj.PrimaryPart or obj:FindFirstChildOfClass("Part")
                if mainPart and not mainPart:FindFirstChild("ESP_Gui") then
                    local billboard = Instance.new("BillboardGui")
