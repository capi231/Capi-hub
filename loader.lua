-- CAPI HUB LOADER

local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local player = Players.LocalPlayer
local HWID = RbxAnalyticsService:GetClientId()

local Keys = {
    ["CAPI-A1B2"] = false,
    ["CAPI-C3D4"] = false,
    ["CAPI-E5F6"] = false,
}

if not _G.Key then
    player:Kick("Please set _G.Key before executing the script.")
    return
end

if Keys[_G.Key] == nil then
    player:Kick("Invalid key.")
    return
end

if Keys[_G.Key] == false then
    -- erster Start → HWID binden
    Keys[_G.Key] = HWID
elseif Keys[_G.Key] ~= HWID then
    player:Kick("Key already used on another device.")
    return
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/capi231/Capi-hub/main/main.lua"))()
