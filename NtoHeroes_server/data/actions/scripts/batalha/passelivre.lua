domodlib('task_func')
function onUse(cid, item, fromPos, itemEx, toPos)
	if getTaskPoints(cid) <= 69 then
		doPlayerSendTextMessage(cid,22,"Voc� ganhou + 5 Ponto de Miss�o")	
		setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+5))
	else
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� atingiu o seu limite.")
	end
    return true
end