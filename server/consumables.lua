
-- Drink

exports['qr-core']:CreateUseableItem("water_bottle", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

exports['qr-core']:CreateUseableItem("coffee", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

-- DrinkAlcohol

exports['qr-core']:CreateUseableItem("vodka", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

exports['qr-core']:CreateUseableItem("beer", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

exports['qr-core']:CreateUseableItem("whiskey", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

-- EAT

exports['qr-core']:CreateUseableItem("sandwich", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

exports['qr-core']:CreateUseableItem("bread", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

exports['qr-core']:CreateUseableItem("apple", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

exports['qr-core']:CreateUseableItem("chocolate", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- OTHER

exports['qr-core']:CreateUseableItem("cigarette", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Smoke", source, item.name)
    end
end)

exports['qr-core']:CreateUseableItem("cigar", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Smoke", source, item.name)
    end
end)

exports['qr-core']:CreateUseableItem("binoculars", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

exports['qr-core']:CreateUseableItem("dual", function(source, item)
    local Player = exports['qr-core']:GetPlayer(source)
    TriggerClientEvent("qb:Dual", source)
end)