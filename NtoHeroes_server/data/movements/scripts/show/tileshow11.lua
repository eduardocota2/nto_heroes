local message = [[
Set Saga N�vel [ 11 ]

Conquist�vel em :

Miss�o NPC Naruto / Boss Victory Naruto
Local : Castelo Guild Dominante

Requer Lv : 150

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end