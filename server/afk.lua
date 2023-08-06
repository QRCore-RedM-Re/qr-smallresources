RegisterNetEvent('qr-afkkick:server:KickForAFK', function()
    local src = source
	DropPlayer(src, 'You Have Been Kicked For Being AFK')
end)

QRCore.Functions.CreateCallback('qr-afkkick:server:GetPermissions', function(source, cb)
    local src = source
    local group = QRCore.Functions.GetPermission(src)
    cb(group)
end)
