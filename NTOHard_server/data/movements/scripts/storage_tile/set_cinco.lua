local storages = {11205} -- storages que ser�o verificadas


function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para acessar esse local.")
        return doTeleportThing(cid, fromPosition)
    end
end
end