local message = [[
Set Saga N�vel [ 6 ]

O Set pode ser conquistado em Miss�o

Local : Proximidades de Getsugakure
Requer : Farm de Items

Requer Lv : 60
]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end