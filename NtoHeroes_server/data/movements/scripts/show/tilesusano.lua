local message = [[
Susano Arch Rare Nivel [ I ]

Conquist�vel em :
Drop - Sasuke The Last

Bonus Especial :
+ 20 Leveis em Skill Destreza.


]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end