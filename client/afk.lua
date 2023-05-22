QRCore = exports['qr-core']:GetCoreObject()

-- AFK Kick Time Limit (in seconds)
local group = 'user'
local secondsUntilKick = 1800

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
        local playerPed = PlayerPedId()
        if LocalPlayer.state.isLoggedIn then
            if group == 'user' then
                currentPos = GetEntityCoords(playerPed, true)
                if prevPos ~= nil then
                    if currentPos == prevPos then
                        if time ~= nil then
                            if time > 0 then
                                if time == (900) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (600) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (300) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (150) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!', 'error', 10000)
                                elseif time == (60) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minute!', 'error', 10000)
                                elseif time == (30) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                                elseif time == (20) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                                elseif time == (10) then
                                    QRCore.Functions.Notify(9, 'You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
                                end
                                time = time - 1
                            else
                                TriggerServerEvent('qr-afkkick:server:KickForAFK')
                            end
                        else
                            time = secondsUntilKick
                        end
                    else
                        time = secondsUntilKick
                    end
                end
                prevPos = currentPos
            end
        end
    end
end)
