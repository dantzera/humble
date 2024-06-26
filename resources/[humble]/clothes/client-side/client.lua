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
Tunnel.bindInterface("clothes",Humble)
Humble = Tunnel.getInterface("clothes")
vSERVER = Tunnel.getInterface("clothes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
local clothesList = {
	-- Clothes
	{ -568.94,-586.27,34.68,"Clothes",false },
	{ -525.48,-594.93,41.43,"Clothes",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(clothesList) do
		exports["target"]:AddCircleZone("Clothes:"..k,vec3(v[1],v[2],v[3]),1.75,{
			name = "Clothes:"..k,
			heading = 3374176
		},{
			shop = k,
			Distance = 1.75,
			options = {
				{
					event = "clothes:openClothes",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHES:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("clothes:openClothes", function(shopId)
        TriggerScreenblurFadeIn(500)
        SetNuiFocus(true, true)
        TriggerEvent("hud:Active", false)
        SendNUIMessage({ action = "show", items = Humble.getItems(), money = Humble.getMoney() })
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