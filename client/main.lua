
PlayerData                = {}
ESX                             = nil

	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(10)
		end
	
		while ESX.GetPlayerData() == nil do
			Citizen.Wait(10)
		end
	
		  PlayerData = ESX.GetPlayerData()
	end)



RegisterCommand("gpsisaretle", function(source, args, rawCommand)
	Citizen.Wait(500)
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	print(PlayerData.job.name)
	if PlayerData.job and PlayerData.job.name == 'police' or PlayerData.job and PlayerData.job.name == 'ambulance' then 
	local player = GetPlayerFromServerId(args[1])
	local ped = GetPlayerPed(player)
	local pos = GetEntityCoords(ped, true)
	SetNewWaypoint(pos.x, pos.y)
	TriggerEvent('chatMessage', '', {255, 255, 255}, 'İşaretlendi ' .. args[1])


end

end)

