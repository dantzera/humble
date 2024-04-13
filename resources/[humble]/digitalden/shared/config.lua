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
config.itemsDigitalden = {
	["utilitários"] = {
		{ item = "cellphone", quantidade = 1, compra = 575, descricao = "Telefone Pessoal.", img = "cellphone" },
		{ item = "radio", quantidade = 1, compra = 875, descricao = "Rádio.", img = "radio" },
		{ item = "vape", quantidade = 1, compra = 4750, descricao = "Pendrive de Fumaça.", img = "vape" },
		{ item = "binoculars", quantidade = 1, compra = 275, descricao = "Binóculos.", img = "binoculars" },
		{ item = "camera", quantidade = 1, compra = 275, descricao = "Câmera Fotográfica.", img = "camera" },
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
for k in pairs(config.itemsDigitalden) do
	for i in ipairs(config.itemsDigitalden[k]) do
		config.itemsDigitalden[k][i].name = getItemName(config.itemsDigitalden[k][i].item)
	end
end