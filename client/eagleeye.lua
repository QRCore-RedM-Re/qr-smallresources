local function EnableEagleeye(player, enable)
	Citizen.InvokeNative(0xA63FCAD3A6FEC6D2, player, enable)
end

AddEventHandler("playerSpawned", function()
	local ped = PlayerPedId()
	EnableEagleeye(ped, true)
end)

AddEventHandler("onResourceStop", function(resourceName)
	local ped = PlayerPedId()
    if (GetCurrentResourceName() == resourceName) then
        EnableEagleeye(ped, false)
	end
end)
