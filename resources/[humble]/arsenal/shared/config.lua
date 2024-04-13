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
config.itemsArsenal = {
	["armas de fogo"] = {
		{ item = "WEAPON_CARBINERIFLE", quantidade = 1, compra = 1275, descricao = "M4A1.", img = "m4a1" },
		{ item = "WEAPON_CARBINERIFLE_MK2", quantidade = 1, compra = 2450, descricao = "M4A4.", img = "m4a4" },
		{ item = "WEAPON_BULLPUPRIFLE", quantidade = 1, compra = 1475, descricao = "QBZ-95.", img = "qbz95" },
		{ item = "WEAPON_SMG", quantidade = 1, compra = 1200, descricao = "Heckler & Koch MP5.", img = "mp5" },
		{ item = "WEAPON_SMG_MK2", quantidade = 1, compra = 1200, descricao = "Heckler & Koch MP5.", img = "evo3" },
		{ item = "WEAPON_STUNGUN", quantidade = 1, compra = 250, descricao = "Tazer.", img = "stungun" },
		{ item = "WEAPON_COMBATPISTOL", quantidade = 1, compra = 975, descricao = "Pistola de Combate.", img = "glock" },
		{ item = "WEAPON_HEAVYPISTOL", quantidade = 1, compra = 3750, descricao = "Pistola Pesada.", img = "atifx45" },
		{ item = "WEAPON_APPISTOL", quantidade = 1, compra = 1200, descricao = "Koch Vp9.", img = "kochvp9" },
		{ item = "WEAPON_PARAFAL", quantidade = 1, compra = 1775, descricao = "PARA-FAL M964A1.", img = "parafal" }
	},
	["munições"] = {
		{ item = "WEAPON_PISTOL_AMMO", quantidade = 100, compra = 500, descricao = "Munição de Pistola.", img = "pistolammo" },
		{ item = "WEAPON_SMG_AMMO", quantidade = 100, compra = 500, descricao = "Munição de SMG.", img = "smgammo" },
		{ item = "WEAPON_RIFLE_AMMO", quantidade = 100, compra = 500, descricao = "Munição de SMG.", img = "rifleammo" }
	},
	["utilitários"] = {
		{ item = "vest", quantidade = 1, compra = 250, descricao = "Proteção Tática.", img = "vest" },
		{ item = "gsrkit", quantidade = 1, compra = 35, descricao = "Kit Residual.", img = "gsrkit" },
		{ item = "gdtkit", quantidade = 1, compra = 35, descricao = "Kit Químico.", img = "gdtkit" },
		{ item = "barrier", quantidade = 1, compra = 125, descricao = "Barreira Tática.", img = "barrier" },
		{ item = "handcuff", quantidade = 1, compra = 200, descricao = "Algemas de Ferro.", img = "handcuff" },
		{ item = "divingsuit", quantidade = 1, compra = 480, descricao = "Roupa de Mergulho.", img = "divingsuit" },
		{ item = "coptablet", quantidade = 1, compra = 500, descricao = "Tablet Policial.", img = "coptablet" },
		{ item = "ATTACH_FLASHLIGHT", quantidade = 1, compra = 275, descricao = "Lanterna Tática.", img = "attach_flashlight" },
		{ item = "ATTACH_CROSSHAIR", quantidade = 1, compra = 275, descricao = "Mira Holográfica.", img = "attach_crosshair" },
		{ item = "ATTACH_CROSSHAIR2", quantidade = 1, compra = 275, descricao = "Mira Holográfica.", img = "attach_crosshair2" },
		{ item = "ATTACH_CROSSHAIR3", quantidade = 1, compra = 275, descricao = "Mira Holográfica.", img = "attach_crosshair3" },
		{ item = "ATTACH_SILENCER", quantidade = 1, compra = 275, descricao = "Silenciador Tático.", img = "attach_silencer" },
		{ item = "ATTACH_MAGAZINE", quantidade = 1, compra = 275, descricao = "Pente Estendido.", img = "attach_magazine" },
		{ item = "ATTACH_GRIP", quantidade = 1, compra = 275, descricao = "Empunhadura Tática.", img = "attach_grip" },
		{ item = "ATTACH_MUZZLE_FAT", quantidade = 1, compra = 275, descricao = "Compensador Pesado.", img = "attach_muzzle_fat" },
		{ item = "ATTACH_BARREL", quantidade = 1, compra = 275, descricao = "Cano Pesado.", img = "attach_barrel" },
		{ item = "ATTACH_MUZZLE_HEAVY", quantidade = 1, compra = 275, descricao = "Compensador Tático.", img = "attach_muzzle_heavy" },
		{ item = "WEAPON_NIGHTSTICK", quantidade = 1, compra = 250, descricao = "Cassetete.", img = "nightstick" },
		{ item = "WEAPON_FLASHLIGHT", quantidade = 1, compra = 750, descricao = "Lanterna Tática.", img = "flashlight" },
		{ item = "WEAPON_SMOKEGRENADE", quantidade = 1, compra = 475, descricao = "Granada de Fumaça.", img = "smokegrenade" },
		{ item = "radio", quantidade = 1, compra = 875, descricao = "Rádio.", img = "radio" }
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
for k in pairs(config.itemsArsenal) do
	for i in ipairs(config.itemsArsenal[k]) do
		config.itemsArsenal[k][i].name = getItemName(config.itemsArsenal[k][i].item)
	end
end