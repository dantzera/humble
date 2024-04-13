-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Humble = {}
Tunnel.bindInterface("dynamic",Humble)
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local Works = {
	["Driver"] = "Motorista",
	["Delivery"] = "Entregador",

	["Dismantle"] = "Desmanche",
	["Tows"] = "Reboque",

	["Transporter"] = "Transportador",
	["Lumberman"] = "Lenhador"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.Experience()
	local source = source
	local Passport = vRP.Passport(source)
	local Datatable = vRP.Datatable(Passport)
	if Passport and Datatable then
		local Experiences = {}

		for Index,v in pairs(Works) do
			if Datatable[Index] then
				Experiences[v] = Datatable[Index]
			else
				Experiences[v] = 0
			end
		end

		return Experiences
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXCLUSIVAS
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.Exclusivas()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Clothes = {}
		local Consult = vRP.GetSrvData("Exclusivas:"..Passport)

		for Index,v in pairs(Consult) do
			Clothes[#Clothes + 1] = { ["name"] = Index, ["id"] = v["id"], ["texture"] = v["texture"] or 0, ["type"] = v["type"] }
		end

		return Clothes
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Identity
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.Identity()
	local source = source
	local Passport = vRP.Passport(source)
	local Identity = vRP.Identity(Passport)
	if Passport then
		return Passport,name,phone,blood,premium,gemstone
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:EMERGENCYANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:EmergencyAnnounce")
AddEventHandler("dynamic:EmergencyAnnounce", function()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.HasGroup(Passport,"Police") or vRP.HasGroup(Passport,"Comanf") or vRP.HasGroup(Passport,"Paramedic") then
            TriggerClientEvent("dynamic:closeSystem", source)
            local Keyboard = vKEYBOARD.keyTertiary(source, "Mensagem:", "Cor:", "Tempo (em MS):")
            if Keyboard then
                TriggerClientEvent("Notify", -1, Keyboard[2], Keyboard[1], Keyboard[3])
                TriggerEvent("Discord", "AnnounceEmergency", "**Source:** " .. source .. "\n**Passaporte** " .. Passport .. "\n**Mensagem** " .. Keyboard[1], 3092790)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TENCODES
-----------------------------------------------------------------------------------------------------------------------------------------
local Tencodes = {
	[1] = {
		tag = "QTI",
		text = "A caminho",
		blip = 77
	},
	[2] = {
		tag = "QTH",
		text = "Localização",
		blip = 1
	},
	[3] = {
		tag = "QRR",
		text = "Apoio com prioridade",
		blip = 38
	},
	[4] = {
		tag = "QRT",
		text = "Oficial desmaiado/ferido",
		blip = 6
	},
	[5] = {
		tag = "CD4",
		text = "Área Limpa",
		blip = 6
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE - QTH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:TencodeQTH")
AddEventHandler("dynamic:TencodeQTH", function(Code)
    local source = source
    local Passport = vRP.Passport(source)
    
    if Passport then
        local Ped = GetPlayerPed(source)
        local Coords = GetEntityCoords(Ped)
        local Identity = vRP.Identity(Passport)
        local requiredPermissions = {"Police", "Comanf"}
        
        for _, permission in pairs(requiredPermissions) do
            local Service = vRP.NumPermission(permission)

            for Passports,Sources in pairs(Service) do
                async(function()
                    if Code ~= 4 then
                        vRPC.PlaySound(Sources, "Event_Start_Text", "GTAO_FM_Events_Soundset")
                    end
                    
                    TriggerClientEvent("NotifyPushQTH",Sources,{ code = Tencodes[parseInt(Code)]["tag"], title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
                end)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE - QTI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:TencodeQTI")
AddEventHandler("dynamic:TencodeQTI",function(Code)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Identity = vRP.Identity(Passport)
		local requiredPermissions = {"Police", "Comanf"}
        
        for _, permission in ipairs(requiredPermissions) do
            local Service = vRP.NumPermission(permission)
			
            for Passports,Sources in pairs(Service) do
			async(function()
				if Code ~= 4 then
					vRPC.PlaySound(Sources,"Event_Start_Text","GTAO_FM_Events_Soundset")
				end

					TriggerClientEvent("NotifyPushQTI",Sources,{ code = Tencodes[parseInt(Code)]["tag"], title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE - QRR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:TencodeQRR")
AddEventHandler("dynamic:TencodeQRR",function(Code)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Identity = vRP.Identity(Passport)
		local requiredPermissions = {"Police", "Comanf"}
        
        for _, permission in ipairs(requiredPermissions) do
            local Service = vRP.NumPermission(permission)
			
            for Passports,Sources in pairs(Service) do
			async(function()
				if Code ~= 4 then
					vRPC.PlaySound(Sources,"Event_Start_Text","GTAO_FM_Events_Soundset")
				end

					TriggerClientEvent("NotifyPushQRR",Sources,{ code = Tencodes[parseInt(Code)]["tag"], title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE - QRT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:TencodeQRT")
AddEventHandler("dynamic:TencodeQRT",function(Code)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Identity = vRP.Identity(Passport)
		local requiredPermissions = {"Police", "Comanf"}
        
        for _, permission in ipairs(requiredPermissions) do
            local Service = vRP.NumPermission(permission)
			
            for Passports,Sources in pairs(Service) do
			async(function()
				if Code ~= 4 then
					vRPC.PlaySound(Sources,"Event_Start_Text","GTAO_FM_Events_Soundset")
				end

					TriggerClientEvent("NotifyPushQRT",Sources,{ code = Tencodes[parseInt(Code)]["tag"], title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE - QRT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:TencodeCD4")
AddEventHandler("dynamic:TencodeCD4",function(Code)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local Identity = vRP.Identity(Passport)
		local requiredPermissions = {"Police", "Comanf"}
        
        for _, permission in ipairs(requiredPermissions) do
            local Service = vRP.NumPermission(permission)
			
            for Passports,Sources in pairs(Service) do
			async(function()
				if Code ~= 4 then
					vRPC.PlaySound(Sources,"Event_Start_Text","GTAO_FM_Events_Soundset")
				end

					TriggerClientEvent("NotifyPushCD4",Sources,{ code = Tencodes[parseInt(Code)]["tag"], title = Tencodes[parseInt(Code)]["text"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = Identity["name"].." "..Identity["name2"], time = "Recebido às "..os.date("%H:%M"), blipColor = Tencodes[parseInt(Code)]["blip"] })
				end)
			end
		end
	end
end)