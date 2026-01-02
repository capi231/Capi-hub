-- CAPI HUB KEY LOADER (NO _G.Key)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local player = Players.LocalPlayer
local HWID = RbxAnalyticsService:GetClientId()

-- ====== PAID KEYS ======
local Keys = {
    ["CAPI-A1B3"] = false,
    ["CAPI-C3D4"] = false,
    ["CAPI-E5F6"] = false,
}

-- ====== GUI ======
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "CAPI_KEY_GUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 200)
frame.Position = UDim2.new(0.5, -170, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(15, 5, 5)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "CAPI HUB – KEY SYSTEM"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 80, 80)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9, 0, 0, 40)
box.Position = UDim2.new(0.05, 0, 0.35, 0)
box.PlaceholderText = "Enter your key"
box.Text = ""
box.Font = Enum.Font.Gotham
box.TextSize = 16
box.BackgroundColor3 = Color3.fromRGB(30, 10, 10)
box.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", box)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.9, 0, 0, 40)
btn.Position = UDim2.new(0.05, 0, 0.65, 0)
btn.Text = "UNLOCK"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 18
btn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", btn)

btn.MouseButton1Click:Connect(function()
    local key = box.Text
    if key == "" then return end

    if Keys[key] == nil then
        btn.Text = "INVALID KEY"
        return
    end

    if Keys[key] == false then
        Keys[key] = HWID
    elseif Keys[key] ~= HWID then
        btn.Text = "KEY USED"
        return
    end

    gui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/capi231/Capi-hub/main/main.lua"))()
end)
