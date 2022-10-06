

RegisterNetEvent('qr-afkkick:server:KickForAFK', function()
    local src = source
	DropPlayer(src, 'You Have Been Kicked For Being AFK')
end)

exports['qr-core']:CreateCallback('qr-afkkick:server:GetPermissions', function(source, cb)
    local src = source
    local group = exports['qr-core']:GetPermissions(src)
    cb(group)
end)
