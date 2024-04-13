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
Tunnel.bindInterface("departament",Humble)
Humble = Tunnel.getInterface("departament")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPARTAMENT
-----------------------------------------------------------------------------------------------------------------------------------------
local departList = {
	-- Departament
	{ 24.74,-1346.03,29.95,"Departament",true },
	{ 1164.58,-323.67,69.59,"Departament",true },
	{ -706.4,-914.57,19.59,"Departament",true },
	{ -47.58,-1758.47,29.85,"Departament",true },
	{ 373.11,327.5,104.01,"Departament",true },
	{ -3243.37,1000.36,13.27,"Departament",true },
	{ 548.96,2670.17,42.59,"Departament",true },
	{ 1959.72,3741.19,32.75,"Departament",true },
	{ 1697.47,4923.69,42.48,"Departament",true },
	{ -1819.72,793.34,138.48,"Departament",true },
	{ 1392.16,3605.89,35.39,"Departament",true },
	{ -2966.65,391.63,15.46,"Departament",true },
	{ -3040.14,584.45,8.36,"Departament",true },
	{ 1134.57,-983.0,46.81,"Departament",true },
	{ -1486.9,-377.76,40.55,"Departament",true },
	{ -1221.54,-907.69,12.73,"Departament",true },
	{ 1728.39,6416.21,35.03,"Departament",true },
	{ 812.46,-781.18,26.17,"Departament",true },
	{ 2677.07,3279.95,55.23,"Departament",true },
	{ -1870.27,-340.16,53.81,"Departament",true }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(departList) do
		exports["target"]:AddCircleZone("Depart:"..k,vec3(v[1],v[2],v[3]),1.75,{
			name = "Depart:"..k,
			heading = 3374176
		},{
			shop = k,
			Distance = 1.75,
			options = {
				{
					event = "depart:openDepart",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPARTAMENT:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("depart:openDepart",function(shopId)
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