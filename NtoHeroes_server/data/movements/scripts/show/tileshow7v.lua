local message = [[
Set Saga N�vel [ 7 ]

O Set pode ser conquistado na Loja VIP

OBS : N�o possui restri��o de level para usar

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end