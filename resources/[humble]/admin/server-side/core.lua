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
Tunnel.bindInterface("admin",Humble)
vCLIENT = Tunnel.getInterface("admin")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARRYPLAYERADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
local playerCarryAdmin = {}
function Humble.CarryPlayerAdmin()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			if not vRP.InsideVehicle(source) then
				if playerCarryAdmin[Passport] then
					TriggerClientEvent("player:playerCarryAdmin",playerCarryAdmin[Passport],source)
					TriggerClientEvent("player:Commands",playerCarryAdmin[Passport],false)
					playerCarryAdmin[Passport] = nil
				else
					local ClosestPed = vRPC.ClosestPed(source,2)
					if ClosestPed then
						playerCarryAdmin[Passport] = ClosestPed

						TriggerClientEvent("player:playerCarryAdmin",playerCarryAdmin[Passport],source)
						TriggerClientEvent("player:Commands",playerCarryAdmin[Passport],true)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDVEHS
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("addvehs",function(source,Message)
--     local Passport = vRP.Passport(source)
--     if vRP.HasGroup(Passport,"Admin",1) then
--         if Message[1] and Message[2] then
--             local OtherIdentity = Message[2]
--             local OtherPlayer = vRP.Passport(OtherIdentity)
--             if vRP.Request(source,"Deseja adicionar o carro <b>"..Message[1].."</b> para o Passaporte: <b>"..Message[2].." Sim ou Não") then
--                 vRP.Query("vehicles/addVehicles",{ Passport = Message[2], vehicle = Message[1], plate = vRP.GeneratePlate(), work = "false" })
--                 TriggerClientEvent("Notify",source,"verde", "Você adicionou o veículo <b>"..Message[1].."</b> para o Passaporte: <b>"..Message[2].."</b>.", 5000)
--                 TriggerClientEvent("Notify",OtherPlayer,"verde", "O veículo <b>"..Message[1].."</b> foi adicionado na sua garagem.", 5000)
--             end
--         end
--     end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remcar",function(source,Message)
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Admin",1) then
		if Passport and Message[1] and Message[2] then
			vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(Message[1]), vehicle = Message[2]})
			TriggerClientEvent("Notify",source,"verde","Retirado o veiculo <b>"..Message[2].."</b> da garagem de ID <b>"..Message[1].."</b>.",10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addback",function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    if Passport and args[1] then
        if vRP.HasGroup(Passport,"Admin",1) then
            local nuser_id = parseInt(args[1])
            local amountWeight = parseInt(args[2])
            vRP.SetWeight(nuser_id,amountWeight)
            TriggerClientEvent("Notify",source,"verde","Mochila adicionado para <b>"..nuser_id.."</b> em "..amountWeight.."KG.",5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMBACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remback",function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    if Passport and args[1] then
        if vRP.HasGroup(Passport,"Admin",1) then
            local nuser_id = parseInt(args[1])
            local amountWeight = parseInt(args[2])
            vRP.RemoveWeight(nuser_id,amountWeight)
            TriggerClientEvent("Notify",source,"verde","Mochila removida de <b>"..nuser_id.."</b> em "..amountWeight.."KG.",5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("announce",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) or vRP.HasGroup(Passport,"OAB") then
			local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Tempo (em MS):")
			if Keyboard then
				TriggerClientEvent("Notify",-1,Keyboard[2],Keyboard[1],Keyboard[3])
				TriggerEvent("Discord","AnnounceAdmin","**Source:** "..source.."\n**Passaporte** "..Passport.."\n**Mensagem** "..Keyboard[1],3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("debug",function(source)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			TriggerClientEvent("ToggleDebug",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MODMAIL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("modmail",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) and parseInt(Message[1]) > 0 then
			local OtherPassport = parseInt(Message[1])
			local ClosestPed = vRP.Source(OtherPassport)
			if ClosestPed then
			    local Keyboard = vKEYBOARD.keyTertiary(source,"Mensagem:","Cor:","Tempo (em MS):")
			        if Keyboard then
			        TriggerClientEvent("Notify",ClosestPed,Keyboard[2],Keyboard[1],Keyboard[3])
					TriggerEvent("Discord","ModMail","**Source:** "..source.."\n**Enviado Por:** "..Passport.."\n**Enviado Para:** "..OtherPassport.."\n**Mensagem Enviada:** "..Keyboard[1],3092790)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESTARTED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("restarte",function(source,Message,History)
	if source == 0 then
		GlobalState["Weather"] = "THUNDER"
		TriggerClientEvent("Notify",-1,"amarelo","Um grande terremoto se aproxima, abriguem-se nas garagens e evitem ao máximo ficar em lugares como comunidades e afins durante o terremoto, o terremoto chegará em" ..History:sub(9).. " minutos.",60000)
		print("Terremoto anunciado")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESTARTEDCANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("restartecancel",function(source)
	if source == 0 then
		GlobalState["Weather"] = "EXTRASUNNY"
		TriggerClientEvent("Notify",-1,"amarelo","Nosso sistema meteorológico detectou que o terremoto passou por agora, porém o mesmo pode voltar a qualquer momento.",60000)
		print("Terremoto cancelado")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UGROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ugroups",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and parseInt(Message[1]) > 0 then
		local Messages = ""
		local Groups = vRP.Groups()
		local OtherPassport = Message[1]
		for Permission,_ in pairs(Groups) do
			local Data = vRP.DataGroups(Permission)
			if Data[OtherPassport] then
				Messages = Messages..Permission.."<br>"
			end
		end

		if Messages ~= "" then
			TriggerClientEvent("Notify",source,"verde",Messages,10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("clearinv",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) and parseInt(Message[1]) > 0 then
			TriggerClientEvent("Notify",source,"verde","Limpeza concluída.",5000)
			vRP.ClearInventory(Message[1])
			TriggerEvent("Discord","ClearInv","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Inventario Limpo:** "..Message[1],3092790)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gem",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and parseInt(Message[2]) > 0 then
			local Amount = parseInt(Message[2])
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				TriggerClientEvent("Notify",source,"verde","Gemas entregues.",5000)
				vRP.Query("accounts/AddGems",{ license = Identity["license"], gems = Amount })
				TriggerEvent("Discord","Gemstone","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Para:** "..OtherPassport.."\n**Gemas:** "..Amount.."\n**Address:** "..GetPlayerEndpoint(source),3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("blips",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) or vRP.HasGroup(Passport,"Priv") then
			vRPC.BlipAdmin(source)
			TriggerEvent("Discord","Blips","**Source:** "..source.."\n**Passaporte:** "..Passport.." **ativou o modo de combate**\n",3092790)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			if Message[1] then
				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.UpgradeThirst(OtherPassport,100)
					vRP.UpgradeHunger(OtherPassport,100)
					vRP.DowngradeStress(OtherPassport,100)
					vRP.Revive(ClosestPed,200)
				end
			else
				vRP.Revive(source,200,true)
				vRP.SetArmour(source,200)
				vRP.UpgradeThirst(Passport,100)
				vRP.UpgradeHunger(Passport,100)
				vRP.DowngradeStress(Passport,100)

				TriggerClientEvent("paramedic:Reset",source)

				vRPC.Destroy(source)
				TriggerEvent("Discord","God","**Source:** "..source.."\n**Passaporte:** "..Passport,3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEATH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("death",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			if Message[1] then
				local OtherPassport = parseInt(Message[1])
				local ClosestPed = vRP.Source(OtherPassport)
				if ClosestPed then
					vRP.Revive(ClosestPed,100)
				end
			else
				vRP.Revive(source,100,true)

				TriggerClientEvent("paramedic:Reset",source)

				vRPC.Destroy(source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			if Message[1] and Message[2] and itemBody(Message[1]) ~= nil then
				vRP.GenerateItem(Passport,Message[1],parseInt(Message[2]),true)
				TriggerEvent("Discord","SpawnItens","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Item:** "..Message[1].."\n**Quantidade:** "..Message[2],3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			if Message[1] and Message[2] and Message[3] and itemBody(Message[1]) ~= nil then
				vRP.GenerateItem(Message[3],Message[1],parseInt(Message[2]),true)
				TriggerEvent("Discord","ItensSend","**Source:** "..source.."\n**Enviado Por:** "..Passport.."\n**Item:** "..Message[1].."\n**Quantidade:** "..Message[2].."\n**Recebido Por:** "..Message[3],3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delete",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] then
		if vRP.HasGroup(Passport,"Admin",2) then
			local OtherPassport = parseInt(Message[1])
			vRP.Query("characters/removeCharacter",{ id = OtherPassport })
			TriggerClientEvent("Notify",source,"verde","Personagem <b>"..OtherPassport.."</b> deletado.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("nc",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) or vRP.HasGroup(Passport,"Priv") then
			vRPC.noClip(source)
			TriggerEvent("Discord","Ghost","**Source:** "..source.."\n**Passaporte:** "..Passport,3092790)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) and parseInt(Message[1]) > 0 then
			local OtherSource = vRP.Source(Message[1])
			if OtherSource then
				TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..Message[1].."</b> expulso.",5000)
				vRP.Kick(OtherSource,"Expulso da cidade.")
				TriggerEvent("Discord","Kick","**Source:** "..source.."\n**Expulso Por:** "..Passport.."\n**Passaporte** "..OtherSource,3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban", function(source, Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport, "Admin",3) and tonumber(Message[1]) > 0 and tonumber(Message[2]) > 0 then
			local Days = tonumber(Message[2])
			local OtherPassport = tonumber(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				local Keyboard = vKEYBOARD.keySingle(source, "Motivo do ban:")
				if Keyboard then
					local BanReason = Keyboard[1]
					vRP.Query("banneds/InsertBanned", { license = Identity["license"], time = Days })
					TriggerClientEvent("Notify", source, "amarelo", "Passaporte <b>" .. OtherPassport .. "</b> banido por <b>" .. Days .. "</b> dias.", 5000)

					local OtherSource = vRP.Source(OtherPassport)
					if OtherSource then
						vRP.Kick(OtherSource, "Banido.")
						TriggerEvent("Discord", "Bans", "**Source:** " .. source .. "\n**Banido Por:** " .. Passport .. "\n**Tempo:** " .. Days .. " **DIAS**\n**Passaporte:** " .. OtherPassport .. "\n**Motivo Banimento:** " .. BanReason, 3092790)
					end
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) and parseInt(Message[1]) > 0 then
			local OtherPassport = parseInt(Message[1])
			local Identity = vRP.Identity(OtherPassport)
			if Identity then
				vRP.Query("banneds/RemoveBanned",{ license = Identity["license"] })
				TriggerClientEvent("Notify",source,"verde","Passaporte <b>"..OtherPassport.."</b> desbanido.",5000)
				TriggerEvent("Discord","Unbans","**Source:** "..source.."\n**Desbanido Por:** "..Passport.."\n**Passaporte:** "..OtherPassport,3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			local Keyboard = vKEYBOARD.keySingle(source,"Cordenadas:")
			if Keyboard then
				local Split = splitString(Keyboard[1],",")
				vRP.Teleport(source,Split[1] or 0,Split[2] or 0,Split[3] or 0)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vKEYBOARD.keyCopy(source,"Cordenadas:",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(heading))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		--if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and Message[2] then
			TriggerClientEvent("Notify",source,"verde","Adicionado <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.",5000)
			vRP.SetPermission(Message[1],Message[2],Message[3])
			TriggerEvent("Discord","Group","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Set Adicionado:** "..Message[2],3092790)
		--end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) and parseInt(Message[1]) > 0 and Message[2] then
			TriggerClientEvent("Notify",source,"verde","Removido <b>"..Message[2].."</b> ao passaporte <b>"..Message[1].."</b>.",5000)
			vRP.RemovePermission(Message[1],Message[2])
			TriggerEvent("Discord","UnGroup","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Set Removido:** "..Message[2],3092790)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(source)
				local Coords = GetEntityCoords(Ped)

				vRP.Teleport(ClosestPed,Coords["x"],Coords["y"],Coords["z"])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) and parseInt(Message[1]) > 0 then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				local Ped = GetPlayerPed(ClosestPed)
				local Coords = GetEntityCoords(Ped)
				vRP.Teleport(source,Coords["x"],Coords["y"],Coords["z"])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			vCLIENT.teleportWay(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("limbo",function(source)
-- 	local Passport = vRP.Passport(source)
-- 	if Passport and vRP.GetHealth(source) <= 100 then
-- 		vCLIENT.teleportLimbo(source)
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hash",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local vehicle = vRPC.VehicleHash(source)
			if vehicle then
				vKEYBOARD.keyCopy(source,"Hash do veículo:",Vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			TriggerClientEvent("admin:vehicleTuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fix",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,10)
			if Vehicle then
				TriggerClientEvent("inventory:repairAdmin",source,Network,Plate)
				TriggerEvent("Discord","Fix","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Veiculo Reparado:** "..Plate,3092790)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limparea",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			vCLIENT.Limparea(source,Coords)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ip',function(source,args,rawCommand)
    local Passport = vRP.Passport(source)
    local tplayer = vRP.Source(parseInt(args[1]))
    if vRP.HasGroup(Passport,"Admin",1) then
        if args[1] and tplayer then
			TriggerClientEvent("Notify",source,"azul",GetPlayerEndpoint(tplayer),5000)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRAVAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('travar',function(source,args)
    local source = source
    local Passport = vRP.Passport(source)
    if vRP.HasGroup(Passport, "Admin",1) then
        if args[1] then
            local nplayer = vRP.Source(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("travar", nplayer)
				TriggerClientEvent("Notify",source,"azul","O jogador foi travado e agora não pode fazer nada.",5000)
            end
        else
            TriggerClientEvent("travar", source)
        end
    end
end)
-------------------------------------------------------------------------------------------------------------------------------------
-- CLEARVEHS
-------------------------------------------------------------------------------------------------------------------------------------
function IsVehicleDriverEmpty(vehicle)
    return GetPedInVehicleSeat(vehicle, -1) == 0
  end
  
  local timer
  
RegisterCommand("clearvehs", function(source, args, rawCommand)
    local player = source
	local Passport = vRP.Passport(source)
    if vRP.HasGroup(player, "Admin",1) then
      local count = 0
      for _, v in pairs(GetAllVehicles()) do
        if IsVehicleDriverEmpty(v) then
          count = count + 1
        end
      end
      if count > 0 then
		print("Todos os veículos sem motorista serão deletados em 1 minuto.")
          
        timer = SetTimeout(60000, function()
            for _, v in pairs(GetAllVehicles()) do
              if IsVehicleDriverEmpty(v) then
                DeleteEntity(v)
              end
            end
			TriggerEvent("Discord","ClearVehs","**Admin:** "..Passport.. "\n**Motivo:** Todos os veículos sem motorista foram deletados para evitar lag no servidor inteiro.",3092790)
          end)
		else
		print("Não há veículos sem motorista para serem deletados.")
      end
 	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESTRAVAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('destravar',function(source,args)
    local source = source
    local Passport = vRP.Passport(source)
    if vRP.HasGroup(Passport, "Admin",1) then
        if args[1] then
            local nplayer = vRP.Source(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("destravar", nplayer)
				TriggerClientEvent("Notify",source,"azul","O jogador foi destravado e agora está livre novamente.",5000)
            end
        else
            TriggerClientEvent("destravar", source)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			TriggerClientEvent("Notify",source,"azul","<b>Jogadores Conectados:</b> "..GetNumPlayerIndices(),5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:COORDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("admin:Coords")
AddEventHandler("admin:Coords",function(Coords)
	vRP.Archive("coordenadas.txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.buttonTxt()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) then
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local heading = GetEntityHeading(Ped)

			vRP.Archive(Passport..".txt",mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"])..","..mathLength(heading))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSOLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("console",function(source,Message,History)
	if source == 0 then
		TriggerClientEvent("Notify",-1,"amarelo",History:sub(9),10000)
		print("Anuncio")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kickall",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin",1) then
			return
		end
	end

	local List = vRP.Players()
	for _,Sources in pairs(List) do
		vRP.Kick(Sources,"Desconectado, a cidade reiniciou.")
		Wait(100)
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("save",function(source)
	if source ~= 0 then
		local Passport = vRP.Passport(source)
		if not vRP.HasGroup(Passport,"Admin",1) then
			return
		end
	end

	TriggerEvent("SaveServer",false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			local List = vRP.Players()
			for OtherPlayer,_ in pairs(List) do
				async(function()
					vRP.GenerateItem(OtherPlayer,Message[1],Message[2],true)
				end)
			end

			TriggerClientEvent("Notify",source,"verde","Envio concluído.",10000)
			TriggerEvent("Discord","SpawnItensAll","**Source:** "..source.."\n**Enviado Por:** "..Passport.."\n**Item:** "..Message[1].."\n**Quantidade:** "..Message[2].."\n**↳ Enviado para todos os jogadores** ",3092790)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACECOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
local Checkpoint = 0
function Humble.raceCoords(vehCoords,leftCoords,rightCoords)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Checkpoint = Checkpoint + 1

		vRP.Archive("races.txt","["..Checkpoint.."] = {")

		vRP.Archive("races.txt","{ "..mathLength(vehCoords["x"])..","..mathLength(vehCoords["y"])..","..mathLength(vehCoords["z"]).." },")
		vRP.Archive("races.txt","{ "..mathLength(leftCoords["x"])..","..mathLength(leftCoords["y"])..","..mathLength(leftCoords["z"]).." },")
		vRP.Archive("races.txt","{ "..mathLength(rightCoords["x"])..","..mathLength(rightCoords["y"])..","..mathLength(rightCoords["z"]).." }")

		vRP.Archive("races.txt","},")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
local Spectate = {}
RegisterCommand("spectate",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",3) or vRP.HasGroup(Passport,"Priv") then
			if Spectate[Passport] then
				local Ped = GetPlayerPed(Spectate[Passport])
				if DoesEntityExist(Ped) then
					SetEntityDistanceCullingRadius(Ped,0.0)
				end

				TriggerClientEvent("admin:resetSpectate",source)
				Spectate[Passport] = nil
			else
				local nsource = vRP.Source(Message[1])
				if nsource then
					local Ped = GetPlayerPed(nsource)
					if DoesEntityExist(Ped) then
						SetEntityDistanceCullingRadius(Ped,999999999.0)
						Wait(1000)
						TriggerClientEvent("admin:initSpectate",source,nsource)
						Spectate[Passport] = nsource
						TriggerEvent("Discord","Spectate","**Source:** "..source.."\n**Passaporte:** "..Passport.." **entrou no modo 7 telas**\n",3092790)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARBERSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("barber",function(source)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin",1) then
			TriggerClientEvent("barbershop:Open",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if Spectate[Passport] then
		Spectate[Passport] = nil
	end
end)