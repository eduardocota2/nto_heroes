function onStepIn(cid, item, position, fromPosition)
if(item.actionid > 30020 and item.actionid < 30100) then
local townId = (item.actionid - 30020)
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora � morador de " .. getTownName(townId) .. ".")
end

return true
end