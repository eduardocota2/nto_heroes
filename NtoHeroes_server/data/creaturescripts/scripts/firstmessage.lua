function onLogin(cid)
local storage = 2522

local message1  = [[

Welcome to NTO Heroes !

Here you will find a genuine shinobi entertainment, we are a server
classic server that seeks to value the game time and the commitment that each player makes when
realizes when interpreting our RPG.

Take it easy and have fun!

]]

if getPlayerStorageValue(cid, storage) == -1 then
doPlayerPopupFYI(cid, message1)
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendTextMessage(cid, 22, "Thank you for coming back "..getPlayerName(cid)..", have fun!")
end
return true
end