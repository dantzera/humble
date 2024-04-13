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
Tunnel.bindInterface("dismantle",Humble)
Humble = Tunnel.getInterface("dismantle")
vSERVER = Tunnel.getInterface("dismantle")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
local dismList = {
	-- Dismantle
	{ 409.16,79.83,98.02,"Dismantle",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(dismList) do
		exports["target"]:AddCircleZone("Dismantle:"..k,vec3(v[1],v[2],v[3]),1.75,{
			name = "Dismantle:"..k,
			heading = 3374176
		},{
			shop = k,
			Distance = 1.75,
			options = {
				{
					event = "dismantle:openDismantle",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("dismantle:openDismantle", function(shopId)
    if Humble.requestDism() then
        TriggerScreenblurFadeIn(500)
        SetNuiFocus(true, true)
        TriggerEvent("hud:Active", false)
        SendNUIMessage({ action = "show", items = Humble.getItems(), money = Humble.getMoney() })
    end
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