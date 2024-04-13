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
config.itemsDeparts = {
	["utilitários"] = {
		{ item = "sugar", quantidade = 1, compra = 475, img = "sugar" },
		{ item = "notepad", quantidade = 1, compra = 475, img = "notepad" },
		{ item = "cigarette", quantidade = 1, compra = 475, img = "cigarette" },
		{ item = "rope", quantidade = 1, compra = 475, img = "rope" },
		{ item = "firecracker", quantidade = 1, compra = 475, img = "firecracker" },
		{ item = "emptybottle", quantidade = 1, compra = 475, img = "emptybottle" },
		{ item = "postit", quantidade = 1, compra = 475, img = "postit" },
		{ item = "rose", quantidade = 1, compra = 475, img = "rose" },
		{ item = "lighter", quantidade = 1, compra = 675, img = "lighter" },
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
for k in pairs(config.itemsDeparts) do
	for i in ipairs(config.itemsDeparts[k]) do
		config.itemsDeparts[k][i].name = getItemName(config.itemsDeparts[k][i].item)
	end
end