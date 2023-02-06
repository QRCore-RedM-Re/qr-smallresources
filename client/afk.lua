local group = 'user'
local secondsUntilKick = 1800
local QRCore = exports['qr-core']:GetCoreObject()

local prevPos, time = nil, nil

RegisterNetEvent('QRCore:Client:OnPlayerLoaded', function()
    QRCore.Functions.TriggerCallback('qr-afkkick:server:GetPermissions', function(UserGroup)
        group = UserGroup
    end)
end)

RegisterNetEvent('QRCore:Client:OnPermissionUpdate', function(UserGroup)
    group = UserGroup
end)

CreateThread(function()
    while true do
        Wait(1000)
        if not LocalPlayer.state.isLoggedIn or group ~= 'user' then
            return
        end
        local ped = PlayerPedId()
        local currentPos = GetEntityCoords(ped, true)
        if prevPos == currentPos then
            if time then
                if time > 10 then
                    if time % 60 ~= 0 then
                        return
                    end
                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. time / 60 .. ' minutes!', 'error', 10000)
                else
                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                end
                time = time - 1
                if time <= 0 then
                    TriggerServerEvent('qr-afkkick:server:KickForAFK')
                end
            end
        else
            prevPos, time = currentPos, secondsUntilKick
        end
    end
end)
