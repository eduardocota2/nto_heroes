local message = [[
Rare Box 

Conquist�vel em :
Quest P/ Kages / NPC Kakashi

Sorteie ( 1 ) Item

Items dispon�veis : 
Items Raros N�vel I e II
]]

		

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end