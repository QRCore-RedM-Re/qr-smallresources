-- Blacklisted Scenarios --
CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
		Wait(10000)
    end
end)

-- Remove Frozen Carriages/Horses (OneSync Fix) --
CreateThread(function()
    while true do Wait(10)
        local Pool = GetGamePool('CVehicle')
        for i = 1, #Pool do
            Wait(10)
            local Veh = IsEntityAVehicle(Pool[i])
            local Stopped = IsVehicleStopped(Pool[i])
            local Horse = Citizen.InvokeNative(0xA8BA0BAE0173457B, Pool[i], 0)
            local Driver = Citizen.InvokeNative(0x2963B5C1637E8A27, Pool[i])
            local Walking = IsPedWalking(Horse)
            if Veh and Stopped then
                if Walking then
                    if Driver ~= PlayerPedId() then
                        if Driver then DeleteEntity(Driver) end
                        DeleteEntity(Pool[i])
                    end
                end
            end
        end
        Wait(Config.StuckWagons * 1000)
    end
end)

-- Remove Events and Challenge Notifications --
AddEventHandler('events:listener', function(name, _)
    if name == 'EVENT_CHALLENGE_GOAL_COMPLETE' or name == "EVENT_CHALLENGE_REWARD" or name == "EVENT_DAILY_CHALLENGE_STREAK_COMPLETED"  then
        print('Hiding Events and Challenge Notify')
        Citizen.InvokeNative(0x6035E8FBCA32AC5E) -- UiFeedClearAllChannels // Hides Toast Notifications
    end
end)