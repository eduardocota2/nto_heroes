local message = [[
Rare Box 

Conquist�vel em :
Miss�o com NPC / Loja VIP

Sorteie ( 1 ) Item

Items dispon�veis : 
1x Item Raro N�vel [I]
1x Item Raro N�vel [II]

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end