local message = [[
Rare Box 

Conquist�vel em :
Recompensa P/ Kages / NPC Kakashi

Sorteie ( 1 ) Item

Items dispon�veis : 
Items Raros N�vel III
]]

		

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end