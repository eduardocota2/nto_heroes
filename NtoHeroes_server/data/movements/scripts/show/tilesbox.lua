local message = [[
					- Rare Box - 

Item Especial, pode ser obtido em miss�o e na Loja VIP.



]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end