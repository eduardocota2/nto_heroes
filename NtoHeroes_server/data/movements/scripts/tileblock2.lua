local message = [[

						( Guia Nto Hard )

Area Restrita : Voc� precisa atingir o Level 5 primeiro.

Derrote criaturas no subsolo de Konoha para adquirir experi�ncia.

]]

function onStepIn(cid, item, position, fromPosition)

level = 5

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
doPlayerPopupFYI(cid, message)
end
return TRUE
end