function onStepIn(cid, item, position, fromPosition)

level = 5
print("playerlvl", getPlayerLevel(cid))
if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
doPlayerSendCancel(cid,"Voc� precisa do level " .. level .. " ou + para acessar esse local.")
end
return TRUE
end