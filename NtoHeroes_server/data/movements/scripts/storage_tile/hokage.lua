local storages = {89455} -- storages que serão verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Voc� precisa se tornar Hokage para acessar este local.")
       doTeleportThing(cid, fromPosition, true)
    end
end
end