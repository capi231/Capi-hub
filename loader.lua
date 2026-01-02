-- ==============================
-- 🔐 CAPI HUB – KEY SYSTEM (MOBILE SAFE)
-- HWID
-- ==============================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- ====== PAID KEYS ======
-- true = gültig
local Keys = {
    ["CAPI-A1B3"] = true,
    ["CAPI-C3D4"] = true,
    ["CAPI-E6B5"] = true,
    ["CAPI-F9K2"] = true,
    ["CAPI-M8Q7"] = true,
    ["CAPI-Z4R6"] = true,
    ["CAPI-P2L9"] = true,
    ["CAPI-W7X5"] = true,
    ["CAPI-H3N8"] = true,
    ["CAPI-Y6D1"] = true,
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

-- ====== LOGIC (KEY ONLY) ======
btn.MouseButton1Click:Connect(function()
    local key = box.Text
    if key == "" then return end

    if not Keys[key] then
        btn.Text = "INVALID KEY"
        return
    end

    gui:Destroy()
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/capi231/Capi-hub/main/main.lua"
    ))()
end)
