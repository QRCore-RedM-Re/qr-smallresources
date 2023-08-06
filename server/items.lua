QRCore.Functions.CreateUseableItem("binoculars", function(source, item)
    local Player = QRCore.Functions.GetPlayer(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

QRCore.Functions.CreateUseableItem("dual", function(source, item)
    local Player = QRCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb:Dual", source)
end)