local storages = {13002} -- storages que ser�o verificadas

local message = [[

( Guia Nto Hard )

Des�a no subsolo de Konoha e procure por criaturas para batalhar !

1� Utilize Jutsus para Curar ( Regeneration ) e Atacar ( Throw Kunai ).
2� Utilize a palavra ( skip ) para subir e sair do calabou�o !

]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13002, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end