local message = [[
Susano Sword Rare Nivel [ III ]

Conquist�vel em :
Drop - Indra Renegade


]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end