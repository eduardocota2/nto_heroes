local message = [[
Gunbai Rare Nivel [ III ]

Conquist�vel em :
Drop - Old Madara

Bonus Especial : 
Defesa 200 
Prote��o Extra a todo tipo de dano em 12 %.
Jutsu - Reflect Gunbai

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end