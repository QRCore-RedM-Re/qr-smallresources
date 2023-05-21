Keys = QRCore.Shared.GetKey({ 'LALT', 'SHIFT', 'TAB', 'X', '8' })
-- https://vespura.com/doc/natives/?_0xC116E6DF68DCE667
--[[
------------------------------
0 : ICON_STAMINA,
1 : ICON_STAMINA_CORE,
2 : ICON_DEADEYE,
3 : ICON_DEADEYE_CORE,
4 : ICON_HEALTH,
5 : ICON_HEALTH_CORE,
6 : ICON_HORSE_HEALTH,
7 : ICON_HORSE_HEALTH_CORE,
8 : ICON_HORSE_STAMINA,
9 : ICON_HORSE_STAMINA_CORE,
10 : ICON_HORSE_COURAGE,
11 : ICON_HORSE_COURAGE_CORE
------------------------------
1 = show
2 = hide
------------------------------
--]]

function IsAimCamActive()
    return Citizen.InvokeNative(0x698F456FB909E077)
end

-- Hide HUD Components --
CreateThread(function()
    for x = 1, #Config.HUD do
        if Config.HUD[x] then
            Citizen.InvokeNative(0xC116E6DF68DCE667, x, 2)
        end
    end
end)

-- Disable Controls --
CreateThread(function()
    while true do
        Wait(3)
        DisableControlAction(0, Keys['LALT'], true) -- Disables LEFT ALT HUD to hide Standalone RDR2 Money/Gold and Bar thingy at the bottom
        if Config.DisableFastMoveAiming then -- Disable Moving Fast While Aiming
            if IsAimCamActive() == 1 then
                DisableControlAction(0, Keys['SHIFT'], true)
            end
        end
        if Config.DisableWeaponWheel then
            DisableControlAction(0, Keys['TAB'], true) -- Disable weapon wheel | TAB (while holding)
        end
    end
end)