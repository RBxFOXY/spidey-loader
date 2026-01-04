-- Spidey Loader v1.0

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")
local ContextActionService = game:GetService("ContextActionService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
while not player do task.wait() end
local PlayerGui = player:WaitForChild("PlayerGui")

------------------------------------------------
-- WEBHOOK
------------------------------------------------
local WEBHOOK_URL = "https://discord.com/api/webhooks/1457436731161972839/xxiwGDyH5mbcQt6pUMnc4owb1D2RmFwjrIpZB3VWzXnKL0keKfP8QqaULUUmhuCa1W_T"

------------------------------------------------
-- FUNÇÕES BÁSICAS (TESTE)
------------------------------------------------
local function criarAviso()
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0,400,0,180)
	frame.Position = UDim2.new(0.5,-200,0.5,-90)
	frame.BackgroundColor3 = Color3.fromRGB(20,20,20)

	local text = Instance.new("TextLabel", frame)
	text.Size = UDim2.new(1,0,1,0)
	text.Text = "✅ Spidey Loader carregado com sucesso"
	text.TextScaled = true
	text.TextColor3 = Color3.new(1,1,1)
	text.BackgroundTransparency = 1
end

criarAviso()
