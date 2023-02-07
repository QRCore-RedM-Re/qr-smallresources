local recoils = {
	--Pistol
	[34411519] = 0.7, --   weapon_pistol_volcanic
	[1252941818] = 0.7, -- `weapon_pistol_mauser_drunk
	[1534638301] = 0.7, -- weapon_pistol_m1899
	[1701864918] = 0.7, -- weapon_pistol_semiauto
	[2239809086] = 0.7, -- weapon_pistol_mauser
	--Repeater
	[1905553950] = 0.7, -- weapon_repeater_evans
	[2511488402] = 0.7, -- weapon_repeater_henry
	[2823250668] = 0.7, -- weapon_repeater_winchester
	[4111948705] = 0.7, -- weapon_repeater_carbine
	--Revolver
	[127400949] = 0.7, -- weapon_revolver_doubleaction
	[379542007] = 0.7, -- weapon_revolver_cattleman
	[383145463] = 0.7, -- weapon_revolver_cattleman_mexican
	[1529685685] = 0.7, -- weapon_revolver_lemat
	[2075992054] = 0.7, -- weapon_revolver_schofield
	[2212320791] = 0.7, -- weapon_revolver_doubleaction_gambler
	--Riflle
	[1676963302] = 0.7, -- weapon_rifle_springfield
	[1999408598] = 0.7, -- weapon_rifle_boltaction
	[3724000286] = 0.7, -- weapon_rifle_varmint
	--Shoutgun
	[392538360] = 0.7, -- weapon_shotgun_sawedoff
	[575725904] = 0.7, -- weapon_shotgun_doublebarrel_exotic
	[834124286] = 0.7, -- weapon_shotgun_pump
	[1674213418] = 0.7, -- weapon_shotgun_repeating
	[1838922096] = 0.7, -- weapon_shotgun_semiauto
	[1845102363] = 0.7, -- weapon_shotgun_doublebarrel
	--SniperRifle
	[1402226560] = 0.7, -- weapon_sniperrifle_carcano
	[3788682007] = 0.7, -- weapon_sniperrifle_rollingblock
}

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if not IsPedShooting(ped) then
			Citizen.Wait(1)
			return
		end

		local wep = GetCurrentPedWeapon(ped, false)
		if not recoils[wep] or recoils[wep] == 0 then
			Citizen.Wait(1)
			return
		end

		local tv = 0
		repeat
			Citizen.Wait(1)
			local p = GetGameplayCamRelativePitch()
			if recoils[wep] > 0.1 then
				SetGameplayCamRelativePitch(p + 0.6, 1.2)
				tv = tv + 0.6
			else
				SetGameplayCamRelativePitch(p + 0.016, 0.333)
				tv = tv + 0.1
			end
		until tv >= recoils[wep]

		Citizen.Wait(1)
	end
end)
