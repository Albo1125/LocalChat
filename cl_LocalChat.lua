local chatRange = 30 -- chat range in metres for local chat.

local localChat = true

RegisterNetEvent('SendProximityChat')
AddEventHandler('SendProximityChat', function(id, name, message)
	local mid = PlayerId()
	local sid = GetPlayerFromServerId(id)
	if sid == mid then
		TriggerEvent('chatMessage', name, {0, 0x99, 255}, message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(mid)), GetEntityCoords(GetPlayerPed(sid)), true) < chatRange then
		TriggerEvent('chatMessage', name, {0, 0x99, 255}, message)
	end
end)

RegisterNetEvent('ToggleLocalChat')
AddEventHandler('ToggleLocalChat', function()
	localChat = not localChat
	if localChat then
		TriggerEvent('chatMessage', 'SYSTEM', {0, 0x99, 255}, "Chat mode toggled to local.")
	else
		TriggerEvent('chatMessage', 'SYSTEM', {0, 0x99, 255}, "Chat mode toggled to global.")
	end
end)

RegisterNetEvent("GetLocalChatStatus")
AddEventHandler("GetLocalChatStatus", function(source, name, message)
	TriggerServerEvent("HandleChatMsg", source, localChat, name, message)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if localChat then
			NetworkSetTalkerProximity(chatRange)
		else
			NetworkSetTalkerProximity(0.0)
		end
	end
end)
