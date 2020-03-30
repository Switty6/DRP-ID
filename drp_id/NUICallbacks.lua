---------------------------------------------------------------------------
-- NUI CALLBACKS
---------------------------------------------------------------------------
RegisterNUICallback("CloseMenu", function(data, callback)
	SetNuiFocus(false, false)
	callback("ok")
end)
---------------------------------------------------------------------------
RegisterNUICallback("SelectYourCharacter", function(data, callback)
	SetNuiFocus(false, false)
	TriggerServerEvent("DRP_ID:SelectCharacter", data.character_selected)
	callback("ok")
end)
---------------------------------------------------------------------------
RegisterNUICallback("CreateCharacter", function(data, callback)
	TriggerServerEvent("DRP_ID:CreateCharacter", {name = data.name, age = data.age, gender = data.gender})
	callback("ok")
end)
---------------------------------------------------------------------------
RegisterNUICallback("DeleteCharacter", function(data, callback)
	TriggerServerEvent("DRP_ID:DeleteCharacter", data.character_id)
	callback("ok")
end)
---------------------------------------------------------------------------
RegisterNUICallback("DisconnectMe", function(callback)
	TriggerServerEvent("DRP_ID:Disconnect")
	callback("ok")
end)

RegisterNUICallback("GarageSpawnPreview", function(data, callback)
	characterSpawnedIn = true
	local pos = {x = data.spawn[1], y = data.spawn[2], z = data.spawn[3]}
	TriggerEvent("DRP_ID:SpawnSelectionCameraChange", pos)
	callback("ok")
end)

RegisterNUICallback("TrainStationPreview", function(data, callback)
	characterSpawnedIn = true
	local pos = {x = data.spawn[1], y = data.spawn[2], z = data.spawn[3]}
	TriggerEvent("DRP_ID:SpawnSelectionCameraChange", pos)
	callback("ok")
end)

RegisterNUICallback("SpawnLocation", function(data, callback)
	print(json.encode(data))
	SetNuiFocus(false, false)
	local spawn = {x = DRPCharacters.SpawnSelectionLocations[data.locationName].x, y = DRPCharacters.SpawnSelectionLocations[data.locationName].y, z = DRPCharacters.SpawnSelectionLocations[data.locationName].z}
	TriggerEvent("DRP_ID:LoadSelectedCharacter", data.ped, spawn, true)
	callback("ok")
end)