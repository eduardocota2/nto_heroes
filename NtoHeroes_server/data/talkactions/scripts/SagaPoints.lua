domodlib('task_func')
function onSay(cid, words, param)
doPlayerSendTextMessage(cid,22,"Voc� possui [".. getTaskPoints(cid).."] Pontos de Gradua��o.")
	return true
end
