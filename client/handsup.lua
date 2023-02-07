CreateThread(function()
    local animDict = "script_proc@robberies@homestead@lonnies_shack@deception"
    RequestAnimDict(animDict)
    while true do
        Citizen.Wait(7)
        if IsControlJustPressed(0, 0x8CC9CD42) then
            local playerPed = PlayerPedId()
            if not IsEntityDead(playerPed) and not Citizen.InvokeNative(0x9682F850056C9ADE, playerPed) then
                if not IsEntityPlayingAnim(playerPed, animDict, "hands_up_loop", 3) then
                    TaskPlayAnim(playerPed, animDict, "hands_up_loop", 2.0, -2.0, -1, 67109393, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
                else
                    ClearPedSecondaryTask(playerPed)
                end
            end
        end
    end
end)
