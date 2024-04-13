-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
config = {}
config.itemNameList = true
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG.ITEMS
-----------------------------------------------------------------------------------------------------------------------------------------
config.itemsDismantle = {
	["ferramentas"] = {
		{ item = "WEAPON_WRENCH", quantidade = 1, compra = 365, descricao = "Chave Inglesa.", img = "wrench" },
		{ item = "toolbox", quantidade = 1, compra = 315, descricao = "Ferramentas Básicas.", img = "toolbox" },
		{ item = "advtoolbox", quantidade = 1, compra = 765, descricao = "Ferramentas Avançadas.", img = "toolbox" },
		{ item = "tyres", quantidade = 1, compra = 115, descricao = "Pneu.", img = "tyres" },
		{ item = "WEAPON_CROWBAR", quantidade = 1, compra = 365, descricao = "Pé de Cabra.", img = "crowbar" },
		{ item = "lockpick", quantidade = 1, compra = 375, descricao = "Utilizada para roubar veículos.", img = "lockpick" },
		{ item = "lockpick2", quantidade = 1, compra = 575, descricao = "Utilizada para roubar propriedades..", img = "lockpick2" }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETITEMNAME
-----------------------------------------------------------------------------------------------------------------------------------------
function getItemName(item)
	if config.itemNameList then
		return vRP.itemNameList(item)
	end
	return vRP.getItemName(item)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPAIRS
-----------------------------------------------------------------------------------------------------------------------------------------
for k in pairs(config.itemsDismantle) do
	for i in ipairs(config.itemsDismantle[k]) do
		config.itemsDismantle[k][i].name = getItemName(config.itemsDismantle[k][i].item)
	end
end