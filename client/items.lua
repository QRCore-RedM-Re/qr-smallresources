RegisterNetEvent("qb:Dual", function()
    local player = cache.ped
	Citizen.InvokeNative(0xB282DC6EBD803C75, player, GetHashKey("weapon_revolver_cattleman"), 500, true, 0)
	Citizen.InvokeNative(0x5E3BDDBCB83F3D84, player, GetHashKey("weapon_pistol_volcanic"), 500, true, 0, true, 1.0)
end)