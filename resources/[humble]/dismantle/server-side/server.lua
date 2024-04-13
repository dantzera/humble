-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Humble = {}
Tunnel.bindInterface("arsenal", Humble)
vCLIENT = Tunnel.getInterface("arsenal")
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.requestDism()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if vRP.HasGroup(Passport, "Dismantle") then
            return true
        else
            TriggerClientEvent("Notify", source, "amarelo", "Você não tem permissão para acessar o arsenal malandro(a).", 5000)
            return false
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.buyItem(item)
	local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local price
        for k, v in pairs(config.itemsDismantle) do
            for i, b in pairs(v) do
                if b.item == item then
                    quantidade = b.quantidade
                    price = b.compra
                    break
                end
            end
        end

		if not vRP.MaxItens(Passport, item, quantidade) then
            if (vRP.InventoryWeight(Passport) + ItemWeight(item) * quantidade) <= vRP.GetWeight(Passport) then
                if price and vRP.PaymentBank(Passport, price) then
                    vRP.GiveItem(Passport, item, quantidade)
                    TriggerClientEvent("Notify", source, "verde", "Você comprou " .. quantidade .. "x <b>" .. itemName(item) .. "</b> por <b>$" .. price .. "</b>.", 5000)
                else
                    TriggerClientEvent("Notify", source, "amarelo", "Dinheiro insuficiente.", 5000)
                end
            else
                TriggerClientEvent("Notify", source, "amarelo", "Espaço insuficiente.", 5000)
            end
        else
            TriggerClientEvent("Notify", source, "amarelo", "Limite de compra atingido.", 5000)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETITEMS
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.getItems()
    local items = {}
    for k, v in pairs(config.itemsDismantle) do
        items[k] = {}
        for i, b in pairs(v) do
			if itemBody(b.item) then
				table.insert(items[k], { item = b.item, name = b.name, quantidade = b.quantidade, compra = b.compra, descricao = b.descricao, img = b.img })
			end
        end
    end
    return items
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETMONEY
-----------------------------------------------------------------------------------------------------------------------------------------
function Humble.getMoney()
    local Passport = vRP.Passport(source)
    if Passport then
        return vRP.GetBank(Passport)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPAIRS
-----------------------------------------------------------------------------------------------------------------------------------------
for k, v in pairs(config.itemsDismantle) do
    for i, b in pairs(v) do
		if itemBody(b.item) then
			b.name = itemName(b.item)
		end
    end
end