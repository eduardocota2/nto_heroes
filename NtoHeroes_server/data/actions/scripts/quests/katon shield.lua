domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 31303) < 1 then
doPlayerAddItem(cid, 139, 1)
doPlayerAddExp(cid, 117700)
doPlayerSendTextMessage(cid, 22, "Parab�ns, voc� completou a Quest Katon Snake Shield!")
doSendMagicEffect(position1, 186)
setPlayerStorageValue(cid, 31303, 1)
doPlayerSendTextMessage(cid,22,"Voc� ganhou + 1 Ponto de Gradua��o")	
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "N�o h� nada para voc� aqui.")
end

return TRUE
end