-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	-- Public
	{ ["Name"] = "Paramedic-1", ["Coords"] = vec3(1135.77,-1545.98,35.48), ["Mode"] = "2" },
	{ ["Name"] = "Paramedic-2", ["Coords"] = vec3(1828.41,3674.97,34.41), ["Mode"] = "2" },
	{ ["Name"] = "Paramedic-3", ["Coords"] = vec3(-258.00,6332.62,32.72), ["Mode"] = "2" },
	{ ["Name"] = "PoliceB", ["Coords"] = vec3(-2383.78,3287.48,38.07), ["Mode"] = "1" },
	{ ["Name"] = "PoliceD", ["Coords"] = vec3(382.46,-1608.49,30.49), ["Mode"] = "1" },
	{ ["Name"] = "PoliceC", ["Coords"] = vec3(1844.31,2573.84,46.26), ["Mode"] = "1" },
	{ ["Name"] = "PoliceS", ["Coords"] = vec3(1851.51,3690.14,34.51), ["Mode"] = "1" },
	{ ["Name"] = "PoliceP", ["Coords"] = vec3(-449.0,6016.89,32.43), ["Mode"] = "1" },
	{ ["Name"] = "Comanf", ["Coords"] = vec3(3934.34,1729.04,24.88), ["Mode"] = "1" },
	{ ["Name"] = "Juridico", ["Coords"] = vec3(-527.96,-185.74,43.35), ["Mode"] = "1" },
	-- Mechanic
	{ ["Name"] = "Ottos", ["Coords"] = vec3(818.15,-932.87,26.44), ["Mode"] = "3" },
	{ ["Name"] = "Dk", ["Coords"] = vec3(-330.52,-162.08,39.25), ["Mode"] = "3" },
	{ ["Name"] = "Harmony", ["Coords"] = vec3(1187.25,2635.53,38.27), ["Mode"] = "3" },
	-- Restaurants
	{ ["Name"] = "Pearls", ["Coords"] = vec3(-1841.57,-1186.37,14.2), ["Mode"] = "3" },
	-- Contraband Sul
	{ ["Name"] = "BackpackSell", ["Coords"] = vec3(708.86,-963.17,30.7), ["Mode"] = "3" },
	{ ["Name"] = "Chiliad", ["Coords"] = vec3(2188.22,5569.48,54.09), ["Mode"] = "3" },
	{ ["Name"] = "Families", ["Coords"] = vec3(-163.85,-1619.42,33.81), ["Mode"] = "3" },
	{ ["Name"] = "Highways", ["Coords"] = vec3(1433.03,6329.65,23.83), ["Mode"] = "3" },
	{ ["Name"] = "Vagos", ["Coords"] = vec3(325.13,-1999.77,24.35), ["Mode"] = "3" },
	-- Contraband North
	{ ["Name"] = "GasStation", ["Coords"] = vec3(-2553.08,2307.61,33.4), ["Mode"] = "3" },
	{ ["Name"] = "Hookies", ["Coords"] = vec3(-2176.41,4293.22,45.89), ["Mode"] = "3" },
	{ ["Name"] = "RoadKill", ["Coords"] = vec3(159.54,6358.84,28.14), ["Mode"] = "3" },
	{ ["Name"] = "Union", ["Coords"] = vec3(2888.51,4426.65,45.21), ["Mode"] = "3" },
	{ ["Name"] = "Fishing", ["Coords"] = vec3(1554.76,3789.3,30.41), ["Mode"] = "3" },
	{ ["Name"] = "Resort", ["Coords"] = vec3(-3042.63,91.88,8.94), ["Mode"] = "3" },
	{ ["Name"] = "YellowJack", ["Coords"] = vec3(1987.13,3046.66,50.46), ["Mode"] = "3" },
	{ ["Name"] = "Blarneys", ["Coords"] = vec3(1938.72,3848.01,31.99), ["Mode"] = "3" },
	{ ["Name"] = "Training", ["Coords"] = vec3(2550.35,3874.17,37.27), ["Mode"] = "3" },
	-- Favelas
	{ ["Name"] = "Favela1", ["Coords"] = vec3(1935.18,-986.1,88.34), ["Mode"] = "3" },
	{ ["Name"] = "Favela2", ["Coords"] = vec3(-462.43,1508.91,396.23), ["Mode"] = "3" },
	{ ["Name"] = "Favela3", ["Coords"] = vec3(2405.24,890.11,109.22), ["Mode"] = "3" },
	{ ["Name"] = "Favela4", ["Coords"] = vec3(3272.5,5156.66,34.71), ["Mode"] = "3" },
	{ ["Name"] = "Favela5", ["Coords"] = vec3(-1743.57,4371.1,66.07), ["Mode"] = "3" },
	-- { ["Name"] = "Sandy", ["Coords"] = vec3(2177.59,4043.24,34.33), ["Mode"] = "3" },
	-- { ["Name"] = "Petroleo", ["Coords"] = vec3(1546.49,-2454.71,80.33), ["Mode"] = "3" },
	-- { ["Name"] = "Praia-1", ["Coords"] = vec3(-3112.42,1423.05,30.14), ["Mode"] = "3" },
	-- { ["Name"] = "Praia-2", ["Coords"] = vec3(-3129.12,1704.1,41.2), ["Mode"] = "3" },
	-- { ["Name"] = "Zancudo", ["Coords"] = vec3(-604.21,2199.58,126.24), ["Mode"] = "3" },
	-- Mafias
	{ ["Name"] = "Madrazzo", ["Coords"] = vec3(1391.16,1158.84,114.13), ["Mode"] = "3" },
	{ ["Name"] = "Lake", ["Coords"] = vec3(-513.98,2967.05,27.86), ["Mode"] = "3" },
	{ ["Name"] = "Route68", ["Coords"] = vec3(500.6,2653.69,44.83), ["Mode"] = "3" },
	{ ["Name"] = "Beacon", ["Coords"] = vec3(2750.7,4945.7,35.34), ["Mode"] = "3" },
	{ ["Name"] = "Vineyard", ["Coords"] = vec3(-1871.1,2057.21,135.44), ["Mode"] = "3" },
	-- { ["Name"] = "FuriousRecords", ["Coords"] = vec3(-985.27,-250.61,38.5), ["Mode"] = "3" },
	{ ["Name"] = "Bahamas", ["Coords"] = vec3(-1376.89,-634.48,30.4), ["Mode"] = "3" },
	{ ["Name"] = "Scuba", ["Coords"] = vec3(2845.31,1622.85,25.6), ["Mode"] = "3" },
	-- Trays
	{ ["Name"] = "PearlsTray01", ["Coords"] = vec3(-1835.04,-1191.86,14.49), ["Mode"] = "4" },
	{ ["Name"] = "PearlsTray02", ["Coords"] = vec3(-1834.07,-1190.12,14.46), ["Mode"] = "4" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Compartimento Geral",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Open",
			label = "Compartimento Pessoal",
			tunnel = "shop",
			service = "Personal"
		},{
			event = "chest:Open",
			label = "Compartimento Evidências",
			tunnel = "shop",
			service = "Evidences"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		}
	},
	["3"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Upgrade",
			label = "Aumentar",
			tunnel = "server"
		},{
			event = "chest:Open",
			label = "Cofre",
			tunnel = "shop",
			service = "Manager"
		}
	},
	["4"] = {
		{
			event = "chest:Open",
			label = "Bandeja",
			tunnel = "shop",
			service = "Tray"
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],1.0,{
			name = "Chest:"..Name,
			heading = 3374176
		},{
			Distance = 1.5,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("chest:Open",function(Name,Init)
	if vSERVER.Permissions(Name,Init) and vSERVER.Verify() then
		TriggerScreenblurFadeIn(500)
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	TriggerScreenblurFadeOut(250.0)
    Wait(250)
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	vSERVER.Update(Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,invPeso,invMaxpeso,chestPeso,chestMaxpeso = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close",function(Action)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
end)