local PVP, RELATION = true, 5
local shown = false
CreateThread(function()
    while true do
        Wait(1)

        if GetRelationshipBetweenGroups(`PLAYER`, `PLAYER`) ~= RELATION then
            NetworkSetFriendlyFireOption(PVP)
            SetRelationshipBetweenGroups(RELATION, `PLAYER`, `PLAYER`)
        end

        if Config.TogglePVP then
            if IsControlJustReleased(0, Keys['8']) then
                PVP = not PVP
                if RELATION == 5 then
                    RELATION = 1 -- Respect
                else
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