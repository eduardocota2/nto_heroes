
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11321) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 8933, 1) 
doPlayerPopupFYI(cid, "Obrigado por participar do Test Server : Voc� recebeu a permiss�o do Hagoromo!" )
doSendMagicEffect(position1, 186)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "N�o h� nada para voc� aqui.")
end
return TRUE
end
