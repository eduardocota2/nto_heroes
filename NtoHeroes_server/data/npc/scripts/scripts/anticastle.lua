local eventArea = {from = {x=756, y=846, z=4}, to = {x=890, y=940, z=8}} -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] N�o � permitido entrar com 2 chares no mesmo ip, desculpe quem joga em lan, Somente 1 entrar�.!")
			return true
		end
	end
	return true
end