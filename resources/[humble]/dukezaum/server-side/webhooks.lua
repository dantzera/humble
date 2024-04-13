-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDS
-----------------------------------------------------------------------------------------------------------------------------------------
Discords = {
	-- Admin Basic
	["Connect"] = "SEU_WEBHOOK",
	["Disconnect"] = "SEU_WEBHOOK",
	["Airport"] = "SEU_WEBHOOK",
	["Deaths"] = "SEU_WEBHOOK",
	["Gemstone"] = "SEU_WEBHOOK",
	["AnnounceAdmin"] = "SEU_WEBHOOK",
	["Me"] = "SEU_WEBHOOK",
	-- Player Basic
	["SendItem"] = "SEU_WEBHOOK",
	["BuyItem"] = "SEU_WEBHOOK",
	-- Player Emergency
	["AnnounceEmergency"] = "SEU_WEBHOOK",
	-- Police
	["TabletPolice"] = "SEU_WEBHOOK",
	["Ficha"] = "SEU_WEBHOOK",
	-- Admin Advanced
	["SpawnItens"] = "SEU_WEBHOOK",
	["ItensSend"] = "SEU_WEBHOOK",
	["SpawnItensAll"] = "SEU_WEBHOOK",
	["Kick"] = "SEU_WEBHOOK",
	["Bans"] = "SEU_WEBHOOK",
	["Unbans"] = "SEU_WEBHOOK",
	["Ghost"] = "SEU_WEBHOOK",
	["Car"] = "SEU_WEBHOOK",
	["God"] = "SEU_WEBHOOK",
	["Group"] = "SEU_WEBHOOK",
	["UnGroup"] = "SEU_WEBHOOK",
	["Fix"] = "SEU_WEBHOOK",
	["Dv"] = "SEU_WEBHOOK",
	["Spectate"] = "SEU_WEBHOOK",
	["ClearInv"] = "SEU_WEBHOOK",
	["ModMail"] = "SEU_WEBHOOK",
	["Blips"] = "SEU_WEBHOOK",
    -- Emergency
	["Police"] = "SEU_WEBHOOK",
	["Paramedic"] = "SEU_WEBHOOK",
	["Mechanic"] = "SEU_WEBHOOK",
	-- Contraband Sul
	["BackpackSell"] = "SEU_WEBHOOK",
	["Chiliad"] = "SEU_WEBHOOK",
	["Families"] = "SEU_WEBHOOK",
	["Highways"] = "SEU_WEBHOOK",
	["Vagos"] = "SEU_WEBHOOK",
	-- Contraband North
	["GasStation"] = "SEU_WEBHOOK",
	["Hookies"] = "SEU_WEBHOOK",
	["RoadKill"] = "SEU_WEBHOOK",
	["Union"] = "SEU_WEBHOOK",
	["Fishing"] = "SEU_WEBHOOK",
	["Resort"] = "SEU_WEBHOOK",
	["YellowJack"] = "SEU_WEBHOOK",
	["Blarneys"] = "SEU_WEBHOOK",
	["Training"] = "SEU_WEBHOOK",
	-- Favelas
	["Barragem"] = "SEU_WEBHOOK",
	["Barragem2"] = "SEU_WEBHOOK",
	["Barragem3"] = "SEU_WEBHOOK",
	["Farol"] = "SEU_WEBHOOK",
	["Parque"] = "SEU_WEBHOOK",
	["Sandy"] = "SEU_WEBHOOK",
	["Petroleo"] = "SEU_WEBHOOK",
	["Praia-1"] = "SEU_WEBHOOK",
	["Praia-2"] = "SEU_WEBHOOK",
	["Zancudo"] = "SEU_WEBHOOK",
    -- Mafias
	["Madrazzo"] = "SEU_WEBHOOK",
	["Playboy"] = "SEU_WEBHOOK",
	["TheSouth"] = "SEU_WEBHOOK",
	["Vineyard"] = "SEU_WEBHOOK",
	["FuriousRecords"] = "SEU_WEBHOOK",
	["Humble"] = "SEU_WEBHOOK",
	["Michael"] = "SEU_WEBHOOK",
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Discord",function(Hook,Message,Color)
	PerformHttpRequest(Discords[Hook],function(err,text,headers) end,"POST",json.encode({
		username = ServerName,
		embeds = { { color = Color, description = Message } }
	}),{ ["Content-Type"] = "application/json" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TABLET POLICE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DiscordTablet",function(Hook,Message,Color,Image)
	PerformHttpRequest(Discords[Hook],function(err,text,headers) end,"POST",json.encode({
		username = ServerName,
		embeds = { { color = Color, description = Message, image = { url = Image } } }
	}),{ ["Content-Type"] = "application/json" })
end)