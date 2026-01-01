
-- ==============================
-- 🔐 AUTH + HWID CHECK
-- ==============================
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local player = Players.LocalPlayer

if not getgenv().Authorized or not getgenv().HWID then
    return
end

if RbxAnalyticsService:GetClientId() ~= getgenv().HWID then
    return
end

-- Flags löschen (Anti-Leak)
getgenv().Authorized = nil
getgenv().HWID = nil

-- ==============================
-- 🎨 GUI CODE (CapiScript)
-- ==============================
local CoreGui = game:GetService("CoreGui")
local ProximityPromptService = game:GetService("ProximityPromptService")

-- Alte GUI entfernen
local oldUI = CoreGui:FindFirstChild("CapiScriptUI")
if oldUI then
    oldUI:Destroy()
end

-- ScreenGui
local CapiScriptUI = Instance.new("ScreenGui")
CapiScriptUI.Name = "CapiScriptUI"
CapiScriptUI.ResetOnSpawn = false
CapiScriptUI.Parent = CoreGui

-- Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 380, 0, 120)
Frame.Position = UDim2.new(0.5, -190, 0.5, -60)
Frame.BackgroundColor3 = Color3.fromRGB(15, 5, 5)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = CapiScriptUI

-- Runde Ecken
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = Frame

-- Roter Rand
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.15
UIStroke.Parent = Frame

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -34, 0, 8)
CloseButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0
CloseButton.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    CapiScriptUI:Destroy()
end)

-- Text
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, -24, 1, -24)
TextLabel.Position = UDim2.new(0, 12, 0, 12)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "CAPI HUB\nWaiting for Steal (NEED Carpet to work)\ndiscord.gg/KGUCcJfd"
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 20
TextLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
TextLabel.TextWrapped = false
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.Parent = Frame

-- ==============================
-- 🚀 PROXIMITY PROMPT TELEPORT
-- ==============================
ProximityPromptService.PromptButtonHoldEnded:Connect(function(prompt, plr)
    if plr == player then
        local char = plr.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local targetPos = Vector3.new(-363.87, -7.71, 104.71) + Vector3.new(0, 5, 0)
            char:MoveTo(targetPos)
        end
    end
end)
