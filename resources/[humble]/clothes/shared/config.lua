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
config.itemsClothes = {
	["utilitários"] = {
		{ item = "teddy", quantidade = 1, compra = 75, descricao = "Ursinho do Amor.", img = "teddy" },
		{ item = "WEAPON_BRICK", quantidade = 1, compra = 25, descricao = "Tijolo Unidade.", img = "brick" },
		{ item = "WEAPON_SHOES", quantidade = 1, compra = 25, descricao = "Sapato Unidade.", img = "shoes" },
		{ item = "rope", quantidade = 1, compra = 875, descricao = "Corda.", img = "rope" }
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
for k in pairs(config.itemsClothes) do
	for i in ipairs(config.itemsClothes[k]) do
		config.itemsClothes[k][i].name = getItemName(config.itemsClothes[k][i].item)
	end
end