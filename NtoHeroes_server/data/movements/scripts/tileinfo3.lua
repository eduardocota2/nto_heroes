local storages = {13003} -- storages que ser�o verificadas

local message = [[

( Guia Nto Hard )

Conhe�a todos os NPC em nosso servidor !

1� Voc� pode comprar Items, Vender Items !
2� Voc� pode realizar miss�es e receber recompensas !
3� Voc� pode realizar trocas de items especiais !


]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13003, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end