Config = {}

Config.EnableProne = true
Config.StuckWagons = 3 -- How often to delete stuck wagons ( Set in Seconds )
Config.DisableFastMoveAiming = true -- When aiming, pressing shift allows you to move faster. Disable that here
Config.DisableWeaponWheel = false -- True to Disable Weapon Wheel | Disables weapon wheel and F4 and weapon wheel actions when using scroll wheel
Config.TogglePVP = false -- Toggle PVP using a key (Prevent random fights/tackling around friendly players)

-- Ped / Animals / Vehicle Density --
Config.Density = {
    pedFrequency = 1.0,
    trafficFrequency = 0.3,
    animalFrequency = 1.0,
}

-- Hide HUD Components --
-- true = hide
Config.HUD = {
    [0] = false, -- ICON_STAMINA
    [1] = false, -- ICON_STAMINA_CORE
    [2] = true, -- ICON_DEADEYE
    [3] = true, -- ICON_DEADEYE_CORE
    [4] = false, -- ICON_HEALTH
    [5] = false, -- ICON_HEALTH_CORE
    [6] = false, -- ICON_HORSE_HEALTH
    [7] = false, -- ICON_HORSE_HEALTH_CORE
    [8] = false, -- ICON_HORSE_STAMINA
    [9] = false, -- ICON_HORSE_STAMINA_CORE
    [10] = false, -- ICON_HORSE_COURAGE
    [11] = false -- ICON_HORSE_COURAGE_CORE
}

ConsumeablesEat = {
	["sandwich"] = math.random(35, 54),
    ["apple"] = math.random(10, 25),
    ["cannedbeans"] = math.random(40, 50),
	["bread"] = math.random(20, 40),
	["chocolate"] = math.random(30, 50),
}

ConsumeablesDrink = {
    ["water"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
}

Config.BlacklistedScenarios = {
    -- These are all from GTA, these need changing
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

-- Blacklist Peds, Vehicles and Objects --
Config.BlacklistEntities = {

    -- Vehicles --
    [`gatling_gun`] = true,
    [`gatlingMaxim02`] = true,
    [`breach_cannon`] = true,
    [`hotchkiss_cannon`] = true,
    [`policeWagongatling01x`] = true,

    -- Ped Models --
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,

    -- Object Models --
    [`prop_sec_barier_02b`] = true,
    [`prop_sec_barier_02a`] = true
}

Config.Teleports = {
--     --Template (needs changing to some default stuff)
--     [1] = {
--         [1] = {
--             coords = vector4(3540.74, 3675.59, 20.99, 167.5),
--             drawText = '[E] Take Elevator Up'
--         },
--         [2] = {
--             coords = vector4(3540.74, 3675.59, 28.11, 172.5),
--             drawText = '[E] Take Elevator Down'
--         },
--     },
--     [2] = {
--         [1] = {
--             coords = vector4(909.49, -1589.22, 30.51, 92.24),
--             drawText = '[E] Enter Coke Processing'
--         },
--         [2] = {
--             coords = vector4(1088.81, -3187.57, -38.99, 181.7),
--             drawText = '[E] Leave'
--         },
--     },
}