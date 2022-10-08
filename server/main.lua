local QRCore = exports['qr-core']:GetCoreObject()

QRCore.Commands.Add("id", "Check Your ID #", {}, false, function(source)
	TriggerClientEvent('QRCore:Notify', source, 9,  "ID: "..source, 5000, 0, 'blips', 'blip_radius_search', 'COLOR_WHITE')
end)

QRCore.Functions.CreateCallback('smallresources:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = 0
    for k, v in pairs(QRCore.Functions.GetQRPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    cb(TotalPlayers)
end)