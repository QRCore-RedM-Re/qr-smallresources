local PVP, RELATION = true, 5
local sleep, shown = 10, false
CreateThread(function()
    while true do
        Wait(sleep)

        if GetRelationshipBetweenGroups(`PLAYER`, `PLAYER`) ~= RELATION then
            NetworkSetFriendlyFireOption(PVP)
            SetRelationshipBetweenGroups(RELATION, `PLAYER`, `PLAYER`)
        else
            if not Config.TogglePVP then sleep = 1000 end
        end

        if Config.TogglePVP then
            if IsControlJustReleased(0, QRCore.Shared.GetKey('8')) then
                PVP = not PVP
                if RELATION == 5 then
                    Citizen.InvokeNative(0xB8DE69D9473B7593, cache.ped, 6) -- Disable Choking
                    RELATION = 1 -- Respect
                else
                    Citizen.InvokeNative(0x949B2F9ED2917F5D, cache.ped, 6) -- Enable Choking
                    RELATION = 5 -- Hate
                end
            end

            if not PVP then
                if not shown then
                    lib.showTextUI('PVP DISABLED', {
                        position = "top-center",
                        icon = 'skull',
                        style = {
                            borderRadius = 0,
                            backgroundColor = '#000000',
                            color = 'white'
                        }
                    })
                    shown = true
                end
            else
                if shown then lib.hideTextUI() shown = false end
            end
        end
    end
end)