function onUse(cid, item)


local magia = "Izanagi"



if getPlayerLearnedInstantSpell(cid, magia) then
doPlayerSendTextMessage(cid,25,"Voc� j� aprendeu esse Jutsu.")
elseif doPlayerLearnInstantSpell(cid, magia) then
local pos = getCreaturePosition(cid)
doSendMagicEffect(pos, 0)
doRemoveItem(item.uid, 1)
doPlayerSendTextMessage(cid,19,"Voc� descobriu um novo Jutsu : "..magia..".")
end
end