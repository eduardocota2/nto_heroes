domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11211) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 7455, 1)
doAddContainerItem(bag, 11476, 1)
doAddContainerItem(bag, 150, 1)
doAddContainerItem(bag, 7456, 1)
doAddContainerItem(bag, 7620, 25) -- Pot
doAddContainerItem(bag, 7618, 25) -- Pot
doPlayerAddExp(cid, 8300)
doPlayerSendTextMessage(cid, 22, "Parab�ns, voc� completou a Quest Set Saga N�vel ( 1 )!")
doSendMagicEffect(position1, 186)
setPlayerStorageValue(cid, 11211, 1)
doPlayerSendTextMessage(cid,22,"Voc� ganhou + 1 Ponto de Gradua��o")	
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "N�o h� nada para voc� aqui.")
end

return TRUE
end