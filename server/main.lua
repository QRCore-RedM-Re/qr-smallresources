QRCore.Functions.CreateCallback('smallresources:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = 0
    for k, v in pairs(QRCore.Functions.GetQRPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    cb(TotalPlayers)
end)

-- Check if Entity is Blacklisted --
local function BlacklistedEntity(ENTITY)
    local eType = GetEntityType(ENTITY)
    local ePop  = GetEntityPopulationType(ENTITY)
    local eModel = GetEntityModel(ENTITY)
    local callback = false

    if eType == 2 then -- Remove Boats
        if ePop ~= 7 and ePop ~= 8 then
            local VehicleType = GetVehicleType(ENTITY)
            if VehicleType == 'boat' then
                return true
            end
        end
    end

    if Config.BlacklistEntities[eModel] then -- Remove Blacklisted
        print('Removing Blacklisted Entity: '..eModel)
        callback = true
    end
    return callback
end

-- Prevent Boats, Blacklisted Vehicles, Peds, Objects from Spawning --
AddEventHandler('entityCreating', function(ENTITY)
    if BlacklistedEntity(ENTITY) then CancelEvent() end
end)