local isBusy = false
local QRCore = exports['qr-core']:GetCoreObject()

local function loadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
    end
    return dict
end

local function loadModel(model)
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
    end
    return model
end

local function doAnim(Amodel, bone, pX, pY, pZ, rX, rY, rZ, anim, Adict, duration)
    local ped = PlayerPedId()
    local model = loadModel(Amodel)
    local coords = GetEntityCoords(ped)
    local object = CreateObject(model, coords.x, coords.y, coords.z, true, false, false)
    AttachEntityToEntity(object, ped, GetEntityBoneIndexByName(ped, bone), pX, pY, pZ, rX, rY, rZ, false, true, true, true, 0, true)
    local dict = loadAnimDict(Adict)
    TaskPlayAnim(ped, dict, anim, 5.0, 5.0, duration, 1, 0.0, false, false, false)
    Citizen.Wait(duration)
    DetachEntity(object, true, true)
    DeleteObject(object)
end

RegisterNetEvent("consumables:client:Drink", function(itemName)
    local ped = PlayerPedId()
    if isBusy then return end
    if IsPedOnMount(ped) or IsPedInAnyVehicle(ped, false) then return end

    isBusy = true
    SetCurrentPedWeapon(ped, `weapon_unarmed`, false)
    Citizen.Wait(100)

    doAnim("p_mugcoffee01x", "SKEL_R_FINGER12", 0.0, -0.05, 0.03, 0.0, 180.0, 180.0, 'action', 'mech_inventory@drinking@coffee', 5000)
    Wait(5000)

    TriggerEvent("inventory:client:ItemBox", QRCore.Shared.Items[itemName], "remove")
    TriggerServerEvent("QRCore:Server:SetMetaData", "thirst",
        QRCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    QRCore.Functions.Notify('You had a drink!', 'success')

    ClearPedTasks(ped)
    isBusy = false
end)

RegisterNetEvent("consumables:client:Smoke", function(itemName)
    if isBusy then return end
    isBusy = true
    local sleep = 10000
    local ped = PlayerPedId()
    SetCurrentPedWeapon(ped, `weapon_unarmed`, false)
    Citizen.Wait(100)

    if IsPedOnMount(ped) or IsPedInAnyVehicle(ped, false) then
        isBusy = false
        return
    end

    local item_model = nil
    local pX, pY, pZ, rX, rY, rZ = nil, nil, nil, nil, nil, nil
    if itemName == "cigar" then
        sleep = 20000
        item_model = "p_cigar01x"
        pX, pY, pZ, rX, rY, rZ = 0.0, 0.03, 0.0, 0.0, 00.0, 0.0
    else
        item_model = "p_cigarette_cs01x"
        pX, pY, pZ, rX, rY, rZ = 0.0, 0.03, 0.01, 0.0, 180.0, 90.0
    end

    doAnim(item_model, "SKEL_R_FINGER12", pX, pY, pZ, rX, rY, rZ, 'base', 'amb_wander@code_human_smoking_wander@cigar@male_a@base', sleep)
    Wait(sleep)

    TriggerEvent("inventory:client:ItemBox", QRCore.Shared.Items[itemName], "remove")
    TriggerServerEvent('hud:server:RelieveStress', math.random(20, 40))
    QRCore.Functions.Notify('You had a smoke!', 'success')

    ClearPedTasks(ped)
    isBusy = false
end)

RegisterNetEvent("consumables:client:DrinkAlcohol", function(itemName)
    if isBusy then return end

    local sleep = 5000
    local ped = PlayerPedId()
    SetCurrentPedWeapon(ped, `weapon_unarmed`, false)
    Citizen.Wait(100)

    if IsPedOnMount(ped) or IsPedInAnyVehicle(ped, false) then
        return
    end

    local bottle = nil
    doAnim("s_inv_whiskey01x", "SKEL_R_FINGER12", 0.0, -0.05, 0.22, 0.0, 180.0, 180.0, 'base_trans_cheers_putaway', 'mp_mech_inventory@drinking@moonshine@drunk@male_a', sleep)
    Wait(sleep)
    isBusy = true

    TriggerEvent("inventory:client:ItemBox", QRCore.Shared.Items[itemName], "remove")
    TriggerServerEvent("QRCore:Server:SetMetaData", "thirst", QRCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
    QRCore.Functions.Notify('You drank some alcohol!', 'success')

    Citizen.Wait(sleep)
    if bottle ~= nil then
        DetachEntity(bottle, true, true)
        DeleteObject(bottle)
    end

    ClearPedTasks(ped)
    isBusy = false
end)

RegisterNetEvent("consumables:client:Eat", function(itemName)
    local ped = PlayerPedId()
    if isBusy then return end
    isBusy = true
    local sleep = 5000
    SetCurrentPedWeapon(ped, `weapon_unarmed`, false)
    Citizen.Wait(100)
    if IsPedOnMount(ped) or IsPedInAnyVehicle(ped, false) then return end

    local dict = loadAnimDict('mech_inventory@eating@multi_bite@wedge_a4-2_b0-75_w8_h9-4_eat_cheese')
    TaskPlayAnim(ped, dict, 'quick_right_hand', 5.0, 5.0, -1, 1, 0.0, false, false, false)

    Wait(sleep)
    TriggerEvent("inventory:client:ItemBox", QRCore.Shared.Items[itemName], "remove")
    TriggerServerEvent("QRCore:Server:SetMetaData", "hunger", QRCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
    TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    QRCore.Functions.Notify('You\'ve eaten something!', 'success')
    ClearPedTasks(ped)
    isBusy = false
end)

RegisterNetEvent("qb:Dual", function()
    local ped = PlayerPedId()
    if IsPedArmed(ped, 7) then
        return
    end

    Citizen.InvokeNative(0xB282DC6EBD803C75, ped, joaat("weapon_revolver_cattleman"), 500, true, 0)
    Citizen.InvokeNative(0x5E3BDDBCB83F3D84, ped, joaat("weapon_pistol_volcanic"), 500, true, 0, true, 1.0)
end)
