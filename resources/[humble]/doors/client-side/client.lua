-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("doors")
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		for k,v in pairs(GlobalState["Doors"]) do
			local distance = #(coords - vector3(v["x"],v["y"],v["z"]))
			if distance <= v["distance"] then
				local closestDoor = GetClosestObjectOfType(v["x"],v["y"],v["z"],v["distance"] + 0.0,v["hash"],false,false,false)
				if closestDoor then
					if v["lock"] then
						local _,h = GetStateOfClosestDoorOfType(v["hash"],v["x"],v["y"],v["z"])
						if h > -0.02 and h < 0.02 then
							FreezeEntityPosition(closestDoor,true)
						end
					else
						FreezeEntityPosition(closestDoor,false)
					end

					if distance <= v["press"] then
						timeDistance = 0

						if v["text"] then
							if v["lock"] then
								DrawText3D(v["x"],v["y"],v["z"],"🔒")
							else
								DrawText3D(v["x"],v["y"],v["z"],"🔓")
							end
						end

						if IsControlJustPressed(1,38) and vSERVER.doorsPermission(k) then
							v["lock"] = not v["lock"]
							vRP.PlayAnim(true,{"anim@heists@keycard@","exit"},false)
							vSERVER.doorsStatistics(k,v["lock"])
							Wait(350)
							vRP.stopAnim()
						end
					end
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)

	if onScreen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)
	end
end