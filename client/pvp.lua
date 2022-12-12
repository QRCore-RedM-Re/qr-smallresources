Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        Citizen.InvokeNative(0xF808475FA571D823, true) --enable friendly fire
        NetworkSetFriendlyFireOption(true)
        SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
    end
end)