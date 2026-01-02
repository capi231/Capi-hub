-- ==============================
-- 🔐 CAPI HUB LOADER (HARDENED)
-- MOBILE SAFE / NO HWID
-- ==============================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ===== Anti-Tamper (mobile safe)
pcall(function()
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
end)

if typeof(loadstring) ~= "function" then
	return
end

-- ====== KEYS (SESSION BASED)
local _K = {
	["CAPI-A1B3"] = true,
	["CAPI-C3D4"] = true,
	["CAPI-E6B5"] = true,
	["CAPI-F9K2"] = true,
	["CAPI-M8Q7"] = true,
	["CAPI-Z4R6"] = true,
}

-- ====== GUI
local g = Instance.new("ScreenGui", CoreGui)
g.Name = "CAPI_LDR"
g.ResetOnSpawn = false

local f = Instance.new("Frame", g)
f.Size = UDim2.new(0, 300, 0, 170)
f.Position = UDim2.new(0.5, -150, 0.5, -85)
f.BackgroundColor3 = Color3.fromRGB(15, 5, 5)
f.BorderSizePixel = 0
f.Active = true
f.Draggable = true
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1, 0, 0, 36)
t.BackgroundTransparency = 1
t.Text = "Capi Hub – Loader"
t.Font = Enum.Font.GothamBold
t.TextSize = 18
t.TextColor3 = Color3.fromRGB(255, 80, 80)

local box = Instance.new("TextBox", f)
box.Size = UDim2.new(0.9, 0, 0, 38)
box.Position = UDim2.new(0.05, 0, 0.38, 0)
box.PlaceholderText = "Enter Key"
box.Text = ""
box.Font = Enum.Font.Gotham
box.TextSize = 16
box.BackgroundColor3 = Color3.fromRGB(30, 10, 10)
box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", box)

local b = Instance.new("TextButton", f)
b.Size = UDim2.new(0.9, 0, 0, 38)
b.Position = UDim2.new(0.05, 0, 0.68, 0)
b.Text = "UNLOCK"
b.Font = Enum.Font.GothamBold
b.TextSize = 17
b.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
b.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", b)

-- ====== OBFUSCATED URL (NEW MAIN)
local _a = "https://raw.githubusercontent.com/"
local _b = "capi231/"
local _c = "kedkekels-nnclsnwlskbd/"
local _d = "main/"
local _e = "main.lua"

local function _get()
	return _a .. _b .. _c .. _d .. _e
end

-- ====== FAKE FLOW
local function _delay()
	task.wait(0.2 + (tick() % 0.3))
end

-- ====== UNLOCK
b.MouseButton1Click:Connect(function()
	local k = box.Text
	if k == "" then return end

	_delay()

	if not _K[k] then
		b.Text = "INVALID KEY"
		return
	end

	-- Session Flag
	getgenv().Authorized = true

	g:Destroy()

	local src
	local ok = pcall(function()
		src = game:HttpGet(_get())
	end)

	if not ok or not src then
		return
	end

	loadstring(src)()
end)
