local message = [[
 
- Vip Coins -

Moeda VIP que pode ser comprada em nossa Loja.
A moeda pode ser utilizada para varias finalidades
seja como moeda de troca entre os jogadores como
tamb�m para adquirir items especiais que podem
ser comprados com NPC Kakashi.

Exemplo : 
Premium Time ( 30 Dias e 10 Dias ) ,
Stamina Pill ( Regenera��o de Stamina ),
Scroll Mokuton ( Trap Wall ),
Dentre outros,

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end