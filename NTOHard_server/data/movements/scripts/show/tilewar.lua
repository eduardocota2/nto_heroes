local message = [[
 
- Grande Castelo Ninja -

O Grande Castelo Ninja � um evento PVP Coletivo do servidor.

Objetivo : Durante 1 Hora o castelo ser� Aberto e o Trono ficar� acess�vel !
A Guild que busca dominar o castelo deve pisar no Trono e impedir at� o ultimo segundo
que outra guild venha fazer o mesmo.

O Evento dura exatamento 1 Hora, apos se esgotar o tempo todos ser�o teleportados ao DP.

Vantagens :
Treiners com Regenera��o de Stamina.
Acesso a F�brica de Adamantium.
NPC Comerciante Exclus�vo.
Boss's Exclusivos.

Horarios :
Quarta Feira  20:00 Hrs
Domingo 	  15:00 Hrs

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end