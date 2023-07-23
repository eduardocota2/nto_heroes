local pos = {x = 1026, y = 1087, z = 6}
local storage = 66620
local storage_a = 66621
local storage_b = 66622
local storage_c = 66623

local message1  = [[

Parab�ns ( Level 5 ) !

Agora voc� dever� iniciar com sua primeira
miss�o com o NPC Hokage Naruto.

 
]]

local message2  = [[

Parab�ns ( Level 10 ) !

Voc� liberou novos Jutsus de Ataque !
Diga !Jutsu para verificar.

]]

local message3  = [[

Parab�ns ( Level 60 ) !

Agora voc� tem level suficiente para
se aliar a ORG Anbu ou Akatsuki !

Bonus : + 10 % Dano em Ninjutsu Extra
Bonus : + 10.000 Pontos de Vida Extra

]]

local message4  = [[

Parab�ns ( Level 80 ) !

Agora voc� tem level suficiente para
se aliar a ORG Otsutsuki !

Bonus : + 10 % Cura Extra
Bonus : + 15.000 Pontos de Vida Extra

]]


function onAdvance(cid, oldLevel, newLevel)

	if getPlayerLevel(cid) == 5 and  getPlayerStorageValue(cid, storage) < 1 then
	doPlayerPopupFYI(cid, message1)
	setPlayerStorageValue(cid, storage, 1)
	doTeleportThing(cid, pos)	
    elseif getPlayerLevel(cid) == 10 and  getPlayerStorageValue(cid, storage_a) < 1 then
	setPlayerStorageValue(cid, storage_a, 1)
    doPlayerPopupFYI(cid, message2)
	elseif getPlayerLevel(cid) == 60 and  getPlayerStorageValue(cid, storage_b) < 1 then
	setPlayerStorageValue(cid, storage_b, 1)
    doPlayerPopupFYI(cid, message3)
	elseif getPlayerLevel(cid) == 80 and  getPlayerStorageValue(cid, storage_c) < 1 then
	setPlayerStorageValue(cid, storage_c, 1)
    doPlayerPopupFYI(cid, message4)
	end

return TRUE

end