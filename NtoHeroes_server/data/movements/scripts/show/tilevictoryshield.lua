local message = [[
Naruto Victory Shield [ III ]

Conquist�vel em :
Miss�o - Naruto do Recanto das Bijus


]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end