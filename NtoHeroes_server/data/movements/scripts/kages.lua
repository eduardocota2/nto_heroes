local message = [[
Parab�ns, esta � a sala de recompensas para Shinobis
de gradua��o ( Kage ) !

Aqui voc� ter� o direito de escolher ( UM ) Personagem
Exclusivo ( OU ) ( Uma ) Super Rare Box.

Ambos os Items podem ser encontrados em nossa Loja VIP
por 50 Pontos, esperamos que voc� fa�a um bom proveito.

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end