function onCombat(cid, target)
	if isPlayer(target) and getPlayerGuildId(cid) ~= 0 and getPlayerGuildId(cid) == getPlayerGuildId(target) then
		doPlayerSendCancel(cid, "You cannot attack players from the same guild.")
		return false
	end
	return true
end