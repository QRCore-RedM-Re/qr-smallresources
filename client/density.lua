local Density = Config.Density
CreateThread(function()
	while true do
		-- Animals --
		Citizen.InvokeNative(0xC0258742B034DFAF, Density.animalFrequency) 	-- SetAmbientAnimalDensityMultiplierThisFrame
		Citizen.InvokeNative(0xDB48E99F8E064E56, Density.animalFrequency) 	-- SetScenarioAnimalDensityMultiplierThisFrame

		-- Peds --
		Citizen.InvokeNative(0xBA0980B5C0A11924, Density.pedFrequency) 		-- SetAmbientHumanDensityMultiplierThisFrame
	    Citizen.InvokeNative(0xAB0D553FE20A6E25, Density.pedFrequency) 		-- SetAmbientPedDensityMultiplierThisFrame
		Citizen.InvokeNative(0x28CB6391ACEDD9DB, Density.pedFrequency) 		-- SetScenarioHumanDensityMultiplierThisFrame
		Citizen.InvokeNative(0x7A556143A1C03898, Density.pedFrequency)		-- SetScenarioPedDensityMultiplierThisFrame

		-- Vehicles --
		Citizen.InvokeNative(0xFEDFA97638D61D4A, Density.trafficFrequency) 	-- SetParkedVehicleDensityMultiplierThisFrame
		Citizen.InvokeNative(0x1F91D44490E1EA0C, Density.trafficFrequency) 	-- SetRandomVehicleDensityMultiplierThisFrame
		Citizen.InvokeNative(0x606374EBFC27B133, Density.trafficFrequency) 	-- SetVehicleDensityMultiplierThisFrame

		Wait(1)
	end
end)
