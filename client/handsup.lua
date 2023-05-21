CreateThread(function()
    while true do
        Wait(7)
        if IsControlJustPressed(0, Keys['X']) then -- x
            local playerPed = PlayerPedId()
            if not IsEntityDead(playerPed) and not Citizen.InvokeNative(0x9682F850056C9ADE, playerPed) then
                local animDict = "script_proc@robberies@homestead@lonnies_shack@deception"

                if not IsEntityPlayingAnim(playerPed, animDict, "hands_up_loop", 3) then
                    if not HasAnimDictLoaded(animDict) then
                        RequestAnimDict(animDict)

                        while not HasAnimDictLoaded(animDict) do
                            Wait(0)
                        end
                    end

                    TaskPlayAnim(playerPed, animDict, "hands_up_loop", 2.0, -2.0, -1, 67109393, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
                    RequestAnimDict(animDict)
                else
                    ClearPedSecondaryTask(playerPed)
                end
            end
        end
    end
end)