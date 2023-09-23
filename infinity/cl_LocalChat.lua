local chatRange = 30 -- chat range in metres for local chat.

local localChat = true

RegisterNetEvent('SendProximityChat')
AddEventHandler('SendProximityChat', function(id, name, message, sourcecoords)
	local mid = PlayerId()
	local sid = GetPlayerFromServerId(id)
	if sid == mid then
		TriggerEvent('chatMessage', name, {0, 0x99, 255}, message)
	elseif GetPlayerPed(sid) ~= nil and DoesEntityExist(GetPlayerPed(sid)) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(mid)), sourcecoords, true) < chatRange then
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