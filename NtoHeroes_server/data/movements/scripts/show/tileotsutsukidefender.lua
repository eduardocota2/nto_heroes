local storages = {55002} -- storages que ser�o verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Voc� n�o tem permiss�o para passar aqui.")
        return doTeleportThing(cid, fromPosition)
    end
end
end