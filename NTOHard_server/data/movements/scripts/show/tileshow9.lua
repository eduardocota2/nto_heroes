local message = [[
Set Saga N�vel [ 9 ]

Conquist�vel em :

Kaguya Helmet      - Drop   : Kaguya
Royal Flame Coat   - Miss�o : Obito
Uchiha Kilt        - Drop   : Old Madara
Royal Uchiha Boots - Miss�o : Madara

Requer Lv : 90

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end