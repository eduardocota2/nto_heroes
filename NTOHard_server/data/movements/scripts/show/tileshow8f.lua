local message = [[
Set Saga N�vel [ 8 ]

O Set � uma evolu��o do Kurama Set N�vel [ 7 ]

Item necess�rio para o Upgrade do Senju Set = Sannin Enchant

O Sannin Enchanted pode ser forjado com Adamantium pelo NPC
Hishura. O Item tamb�m pode ser conquistado na Loja Vip.

]]

		--Mensagem que aparecer� ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end