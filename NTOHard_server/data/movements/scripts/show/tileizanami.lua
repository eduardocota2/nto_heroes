local message = [[
Izanami Glove Rare Nivel [ I ]

Conquist�vel em :
Miss�o - Itachi

Bonus Especial :
+ 15 Leveis em Skill Taijutsu.

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end