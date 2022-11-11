-- Disable Controls 
if Config.DisableWeaponWheel then
    CreateThread(function()
        while true do
            Wait(3)
            -- Weapons | since you have a inventory
            DisableControlAction(0, 0xAC4BD4F1, true) -- Disable weapon wheel | TAB (while holding)
        end
    end)
end
