local message = [[
Set Saga N�vel [ 10 ]

Conquist�vel em :

Set Completo - Drop : Hagoromo

Requer Lv : 100

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end