-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Humble = {}
Tunnel.bindInterface("apphumblegg",Humble)
Proxy.addInterface("apphumblegg",Humble)

vCLIENT = Tunnel.getInterface("apphumblegg")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG USUÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------
local nomeApp = config.nomeApp
local imagemApp = config.imagemApp
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFICAÇÃO DA CONFIG DO USUÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------
local function isStringEmpty(str)
	return str == nil or str:match("^%s*$") ~= nil
end

if nomeApp == nil or isStringEmpty(nomeApp) then
	nomeApp = "Humblegg"
	print("Você não colocou um nome para o app, o nome padrão foi setado!")
end

if imagemApp == nil or isStringEmpty(imagemApp) then
	imagemApp = "https://i.imgur.com/Iyp3y1j.png"
	print("Você não colocou um link para imagem do app, a imagem padrão foi setada!")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE APP SMARTPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('smartphone:isReady', function()
	exports.smartphone:createApp(
	  nomeApp,
	  nomeApp,
	  imagemApp,
	  'nui://apphumblegg/web-side/index.html#'
	)
end)