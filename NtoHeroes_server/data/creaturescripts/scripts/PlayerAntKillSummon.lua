function onCombat(cid, target)
if cid == getCreatureMaster(target) then
doPlayerSendCancel(cid, "You cannot kill your summon.")
return false
end
return true
end