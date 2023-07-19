-- 1�
function savePos(uid, key)
	if isCreature(uid) then
		local pos = getCreaturePosition(uid)
		setPlayerStorageValue(uid, key, pos.x)
		setPlayerStorageValue(uid, key + 1, pos.y)
		setPlayerStorageValue(uid, key + 2, pos.z)
	end
end

-- 2�
function tpBack(uid, pos, eff)
	if isCreature(uid) then
		doTeleportThing(uid, pos)
		addEvent(doSendMagicEffect, 1, getCreaturePosition(uid), eff)
	end
end

-- 3�
function getPos(uid, key)
	if isCreature(uid) then
		pos = {x = getPlayerStorageValue(uid, key), y = getPlayerStorageValue(uid, key+1), z = getPlayerStorageValue(uid, key+2)}
	end
return pos
end

-- 4�
function setItemAid(uid, value)
return doItemSetAttribute(uid, 'aid', value)
end