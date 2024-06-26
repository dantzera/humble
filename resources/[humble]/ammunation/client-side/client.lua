-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Humble = {}
Tunnel.bindInterface("ammunation",Humble)
Humble = Tunnel.getInterface("ammunation")
-----------------------------------------------------------------------------------------------------------------------------------------
-- AMMUNATION
-----------------------------------------------------------------------------------------------------------------------------------------
local ammuList = {
	-- Ammunation
	{ 1692.46,3760.77,35.08,"Ammunation",false },
	{ 253.56,-50.42,70.33,"Ammunation",false },
	{ 842.39,-1035.03,28.6,"Ammunation",false },
	{ -331.43,6084.77,31.83,"Ammunation",false },
	{ -662.23,-933.86,22.22,"Ammunation",false },
	{ -1304.41,-394.57,37.1,"Ammunation",false },
	{ -1118.76,2699.56,18.94,"Ammunation",false },
	{ 2567.97,292.9,109.12,"Ammunation",false },
	{ -3173.26,1088.29,21.2,"Ammunation",false },
	{ 22.51,-1105.77,30.18,"Ammunation",false },
	{ 810.22,-2158.72,30.01,"Ammunation",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(ammuList) do
		exports["target"]:AddCircleZone("Ammu:"..k,vec3(v[1],v[2],v[3]),1.75,{
			name = "Ammu:"..k,
			heading = 3374176
		},{
			shop = k,
			Distance = 1.75,
			options = {
				{
					event = "ammu:openAmmu",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AMMUNATION:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("ammu:openAmmu",function(shopId)
		TriggerScreenblurFadeIn(500)
		SetNuiFocus(true,true)
		TriggerEvent("hud:Active", false)
		SendNUIMessage({action = "show", items = Humble.getItems(), money = Humble.getMoney()})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	TriggerScreenblurFadeOut(250.0)
    Wait(250)
	SetNuiFocus(false,false)
    SetCursorLocation(0.5, 0.5)
	TriggerEvent("hud:Active", true)
	SendNUIMessage({ action = "hide" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACK:COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("comprar", function(data)
	if data and data.item and not block then
		setBlock()
		Humble.buyItem(data.item)
	end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACK:BLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function setBlock()
	block = true
	Citizen.CreateThread(function()
		local time = 3
		while time > 0 do
			Wait(1000)
			time = time - 1
		end
		block = false
	end)
end