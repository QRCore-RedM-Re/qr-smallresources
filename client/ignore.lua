local function deleteEntity(entity, blacklistedModels)
    local model = GetEntityModel(entity)
    if not blacklistedModels[model] then return end
    SetEntityAsMissionEntity(entity, true, true)
    DeleteEntity(entity)
    SetEntityAsNoLongerNeeded(entity)
end

local function handleBlacklistedEntities(entityType, blacklistedModels)
    local pool = GetGamePool(entityType)
    for i = 1, #pool do
        deleteEntity(pool[i], blacklistedModels)
    end
end

Citizen.CreateThread(function()
    while true do
        for i = 1, #Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(Config.BlacklistedScenarios['TYPES'][i], false)
        end
        for i = 1, #Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(Config.BlacklistedScenarios['GROUPS'][i], false)
        end
        Citizen.Wait(10000)
    end
end)

Citizen.CreateThread(function()
    while true do
        handleBlacklistedEntities("CVehicle", Config.BlacklistedVehicles)
        handleBlacklistedEntities("CPed", Config.BlacklistedPeds)
        handleBlacklistedEntities("CObject", Config.BlacklistedObjects)
        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local size = GetNumberOfEvents(0)
        if size == 0 then return end
        for i = 0, size - 1 do
            local eventAtIndex = GetEventAtIndex(0, i)
            if eventAtIndex == joaat("EVENT_CHALLENGE_GOAL_COMPLETE") or eventAtIndex == joaat("EVENT_CHALLENGE_REWARD") or eventAtIndex == joaat("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then
                Citizen.InvokeNative(0x6035E8FBCA32AC5E)
            end
        end
    end
end)
