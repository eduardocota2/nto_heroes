local message = [[
Set Saga N�vel [ 7 ]

Conquist�vel em :
Drop - Kyuubi do Recanto das Bijus

Requer Lv : 70 e Jounin

]]


function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end