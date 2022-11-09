-- Disable Controls 
if Config.DisableWeaponWheel then
CreateThread(function()
    while true do
        Wait(3)
        -- Weapons | since you have a inventory
        DisableControlAction(0, 0xAC4BD4F1, true) -- Disable weapon wheel | TAB (while holding)
        -- LEFT ALT HUD
        DisableControlAction(0, 0xCF8A4ECA, true) -- disable left alt hud | LEFT ALT (fast tapping)
    end
end)