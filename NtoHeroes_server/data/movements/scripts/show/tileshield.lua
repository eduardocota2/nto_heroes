local message = [[
Kaguya Defense Rare Nivel [ II ]

Conquist�vel em :
Drop - Kaguya

Bonus Especial :
Prote��o Extra a todo tipo de dano em 10 %.
Buff Kaguya :
Health And Chakra Regeneration 350p/s.

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end