local localPrefix = ""
local globalPrefix = "[GLOBAL] "

function togglechatfunc(source, args, rawCommand)
	TriggerClientEvent('ToggleLocalChat', source)
end

RegisterCommand('tcl', togglechatfunc, false)

AddEventHandler('chatMessage', function(source, name, message)
	CancelEvent()
	if string.sub(message,1,1) ~= "/" then
		TriggerClientEvent('GetLocalChatStatus', source, source, name, message)	
	end
end)

RegisterServerEvent("HandleChatMsg")
AddEventHandler("HandleChatMsg", function(source, localchat, name, message)
	if localchat then
		TriggerClientEvent("SendProximityChat", -1, source, localPrefix..name, message)
		print(localPrefix..name..":".. message)
	else
		TriggerClientEvent('chatMessage', -1, globalPrefix..name, {0, 0x99, 255}, message)
		print(globalPrefix..name..":".. message)
	end
end)
