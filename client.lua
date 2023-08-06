local AreasToClear = {
	{x = -1235.54, y = 833.6, z = 192.89, r = 30.00}, --Dahlpan's House
	{x = -596.51, y = 222.83, z = 76.21, r = 24.00}, --Lägenhet 1
	{x = 462.64, y = 225.14, z = 103.15, r = 5.00}, --Roos Lägenhet 
	{x = -1937.65, y = 392.71, z = 96.7, r = 20.00}, --Gästhuset
	{x = -578.47, y = -717.34, z = 116.8, r = 10.00}, --Mäklarkontor
	{x = -733.61, y = 493.41, z = 109.57, r = 15.00}, --Blackhouse
	{x = -3083.69, y = 188.94, z = 16.26, r = 15.00}, --Vice City Loft
	{x = -1061.87, y = 722.1, z = 165.6, r = 20.00}, --Solglimten
	{x = -686.25, y = 957.56, z = 238.75, r = 10.00}, --Modern Woodenhouse 1
	{x = -663.31, y = 948.23, z = 243.81, r = 10.00}, --Modern Woodenhouse 2
	{x = -87.8, y = -1813.02, z = 26.91, r = 40.00}, --Modern Woodenhouse 2
}

Citizen.CreateThread(function()
    while true do
        local myCoords = GetEntityCoords(PlayerPedId())
		local sleep = true

		for k,v in ipairs(AreasToClear) do
			if GetDistanceBetweenCoords(myCoords, v.x, v.y, v.z, true) <= 200 then
				sleep = false
				ClearAreaOfPeds(v.x, v.y, v.z, v.r, true)
                ClearAreaOfVehicles(v.x, v.y, v.z, v.r, true)
				AddDispatchSpawnBlockingArea(v.x, v.y, v.z, v.r)
			end
		end

		Citizen.Wait(2500)
		if sleep then
			Citizen.Wait(12500)
		end
    end
end)