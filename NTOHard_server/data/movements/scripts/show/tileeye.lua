local message = [[
Rinnegan Eye Rare Nivel [ II ]

Conquist�vel em :
Miss�o - Renegade Nagato

Bonus Especial :
+ 20 Leveis em Skill Ninjutsu.
Jutsu - Rinnegan Atract 

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end