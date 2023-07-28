domodlib('task_func')
local pos = {x = 1026, y = 1087, z = 6}
local storage = 66620
local storage_a = 66621
local storage_b = 66622
local storage_c = 66623
local storage_d = 66624
local storage_e = 66625
local storage_f = 66626
local stor_g = 66627
local stor_c = 66628
local stor_j = 66629
local stor_k = 66630

local message1  = [[

Congratulations ( Level 5 )     

Now you should start your first
mission with the NPC Hokage Naruto.

You have released a new ATTACK JUTSU !
Say !jutsu to check.

 
]]

local message2  = [[

Congratulations ( Level 10 )

You have released a new Attack Jutsu 
Say !jutsu to check.

]]

local message5  = [[

Congratulations ( Level 20 )

You have released a new Attack Jutsu 
Say !jutsu to check.

]]

local message6  = [[

Congratulations ( Level 25 )

You have released a new Healing Jutsu 	
Say !jutsu to check.

]]

local message8  = [[

Congratulations ( Level 30 )

-> ATTENTION <-
 
From now on PVP mode is activated, you can be attacked or you can attack any other player.

Use Tsunade Amulet to prevent Drop in case of death, you can also choose to use Tsunade's Bless, 
which in addition to preventing Drop also reduces the Skill and Experience losses.

]]

local message3  = [[

Congratulations ( Level 60 )
You now have enough level to join with Anbu or Akatsuki!

Bonus : + 10 % Extra Damage with Ninjutsu 
Bonus : + 3,000 Extra Health Points

]]

local message4  = [[

Congratulations ( Level 80 )

You now have enough level to join Otsutsuki!

Bonus : + 10% Extra Healing
Bonus : + 6.000 Extra Health Points

]]

local message7  = [[

Congratulations ( Level 110 )

You now have enough level to become Hokage!

Bonus : + 10.000 Extra Health Points

]]

local message_g  = [[

Congratulations ( Genin )

You've reached the amount of mission points 
you need to graduate as Genin take the 
certificate on naruto's desk and give it 
to Iruka to receive your reward!

]]

local message_c  = [[

Congratulations ( Chunin )

You have reached the amount of mission points 
you need to graduate as Chunin take the 
certificate on naruto's desk and give it 
to Iruka to receive your reward!

]]

local message_j  = [[

Congratulations ( Jounin )

You've reached the amount of mission points 
you need to graduate as Jounin take the 
certificate on naruto's desk and give it 
to Iruka to receive your reward!

]]

local message_k  = [[

Congratulations ( Kage )

You have reached the amount of mission points 
you need to graduate as a Kage take the 
certificate on naruto's desk and give it 
to Iruka to receive your reward!

]]

function onAdvance(cid, oldLevel, newLevel)

	if getPlayerLevel(cid) == 5 and  getPlayerStorageValue(cid, storage) < 1 then
	doPlayerPopupFYI(cid, message1)
	setPlayerStorageValue(cid, storage, 1)
    elseif getPlayerLevel(cid) == 10 and  getPlayerStorageValue(cid, storage_a) < 1 then
	setPlayerStorageValue(cid, storage_a, 1)
    doPlayerPopupFYI(cid, message2)
	elseif getPlayerLevel(cid) == 60 and  getPlayerStorageValue(cid, storage_b) < 1 then
	setPlayerStorageValue(cid, storage_b, 1)
    doPlayerPopupFYI(cid, message3)
	elseif getPlayerLevel(cid) == 80 and  getPlayerStorageValue(cid, storage_c) < 1 then
	setPlayerStorageValue(cid, storage_c, 1)
    doPlayerPopupFYI(cid, message4)
	elseif getPlayerLevel(cid) == 20 and  getPlayerStorageValue(cid, storage_d) < 1 then
	setPlayerStorageValue(cid, storage_d, 1)
    doPlayerPopupFYI(cid, message5)
	elseif getPlayerLevel(cid) == 25 and  getPlayerStorageValue(cid, storage_e) < 1 then
	setPlayerStorageValue(cid, storage_e, 1)
    doPlayerPopupFYI(cid, message6)
	elseif getPlayerLevel(cid) == 110 and  getPlayerStorageValue(cid, storage_f) < 1 then
	setPlayerStorageValue(cid, storage_f, 1)
    doPlayerPopupFYI(cid, message7)	
	elseif getTaskPoints(cid) >= 40 and getPlayerStorageValue(cid, stor_g) < 1 then
	setPlayerStorageValue(cid, stor_g, 1)
    doPlayerPopupFYI(cid, message_g)
	elseif getTaskPoints(cid) >= 60 and getPlayerStorageValue(cid, stor_c) < 1 then
	setPlayerStorageValue(cid, stor_c, 1)
    doPlayerPopupFYI(cid, message_c)
	elseif getTaskPoints(cid) >= 80 and getPlayerStorageValue(cid, stor_j) < 1 then
	setPlayerStorageValue(cid, stor_j, 1)
    doPlayerPopupFYI(cid, message_j)
	elseif getTaskPoints(cid) >= 100 and getPlayerStorageValue(cid, stor_k) < 1 then
	setPlayerStorageValue(cid, stor_k, 1)
    doPlayerPopupFYI(cid, message_k)
	end
return TRUE

end