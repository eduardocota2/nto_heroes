function onUse(cid, item, fromPosition, itemEx, toPosition)

local cfg = {}

cfg.refuel = 42 * 60 * 1000

if(getPlayerStamina(cid) >= cfg.refuel) then

doPlayerSendCancel(cid, "Voc� n�o precisa regenerar Staminaagora.")


else

doPlayerSetStamina(cid, cfg.refuel)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Stamina Regenerada !")

doRemoveItem(item.uid, 1)

end

return true

end