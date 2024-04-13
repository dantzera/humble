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
config.itemsAmmus = {
	["armas brancas"] = {
		{ item = "WEAPON_KNUCKLE", quantidade = 1, compra = 975, descricao = "Perfeito para arrancar dentes de ouro, ou como um presente para o parceiro de troféu que tem tudo.", img = "knuckle" },
		{ item = "WEAPON_MACHETE", quantidade = 1, compra = 975, descricao = "O comércio de armas da América Ocidental na África Ocidental não envolve apenas doações. Redescubra a vida simples com este cutelo enferrujado.", img = "machete" },
		{ item = "WEAPON_HAMMER", quantidade = 1, compra = 725, descricao = "A robust, multi-purpose hammer with wooden handle and curved claw, this old classic still nails the competition.", img = "hammer" },
		{ item = "WEAPON_GOLFCLUB", quantidade = 1, compra = 975, descricao = "Comprimento padrão, clube de golfe de ferro médio com empunhadura de borracha para um jogo curto letal", img = "golfclub" },
		{ item = "WEAPON_HATCHET", quantidade = 1, compra = 975, descricao = "Um machado é uma ferramenta de corte, ferramenta essa originária do martelo, sendo um martelo que tem pelo menos uma das extremidades amoladas e própria para o corte.", img = "hatchet" },
		{ item = "WEAPON_BAT", quantidade = 1, compra = 975, descricao = "Taco de beisebol de alumínio com alça de couro. Leve, mas poderoso, para todos os grandes rebatedores.", img = "bat" },
		{ item = "WEAPON_BATTLEAXE", quantidade = 1, compra = 975, descricao = "Se é bom o suficiente para soldados medievais, guardas de fronteira modernos e mães agressivas do futebol, é bom o suficiente para você.", img = "battleaxe" },
		{ item = "WEAPON_POOLCUE", quantidade = 1, compra = 975, descricao = "Ah, não há som tão satisfatório quanto o crack de uma pausa perfeita, especialmente quando é a coluna do outro cara", img = "poolcue" },
		{ item = "WEAPON_STONE_HATCHET", quantidade = 1, compra = 975, descricao = "Tem retro, tem vintage e tem isso. Após 5000000 anos de desenvolvimento tecnológico e apocalipse espiritual, o chique pré-colombiano está de volta.", img = "stonehatchet" },
	},
	["utilitarios"] = {
		{ item = "GADGET_PARACHUTE", quantidade = 1, compra = 475, descricao = "", img = "parachute" },
		{ item = "WEAPON_FLASHLIGHT", quantidade = 1, compra = 675, descricao = "", img = "flashlight" },
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
for k in pairs(config.itemsAmmus) do
	for i in ipairs(config.itemsAmmus[k]) do
		config.itemsAmmus[k][i].name = getItemName(config.itemsAmmus[k][i].item)
	end
end