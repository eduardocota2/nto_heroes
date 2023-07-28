local freeBlessMaxLevel = 30
 
function onLogin(cid)
    if(getPlayerLevel(cid) <= freeBlessMaxLevel and not getPlayerBlessing(cid,1)) then
		if not (string.find(tostring(getCreatureName(cid)),"Account Manager")) or getPlayerGroupId(cid) >= 3 then
			for b=1, 5 do
				doPlayerAddBlessing(cid, b)
			end
			doCreatureSay(cid, 'You received Tsunade Bless for having level lower than 30!', TALKTYPE_ORANGE_1)
			doSendMagicEffect(getThingPosition(cid), CONST_ME_EXPLOSIONHIT)
			end
        elseif(getPlayerBlessing(cid,1)) then
			doCreatureSay(cid, 'Blessed By Tsunade!', TALKTYPE_ORANGE_1)
    else
    doCreatureSay(cid, 'You dont have Tsunade Bless!', TALKTYPE_ORANGE_1)
    end
    return true
end