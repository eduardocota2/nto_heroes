local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

if(msgcontains(msg, 'suna') or msgcontains(msg, 'sunagakure')) then
selfSay('Ok, deseja se tornar morador de Sunagakure ? {sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 2160) >= 10) then
doPlayerRemoveItem(cid, 2160, 10)
doPlayerSetTown(cid, 3)
selfSay('Agora voc� reside em Sunagakure!', cid)
else
selfSay('Voc� precisa de 10 Gold para alterar seu registro.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'getsugakure') or msgcontains(msg, 'getsu')) then
selfSay('Ok, deseja se tornar morador de Getsugakure ? {sim}', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 2160) >= 10) then
doPlayerRemoveItem(cid, 2160, 10)
doPlayerSetTown(cid, 4)
selfSay('Agora voc� reside em Getsugakure!', cid)
else
selfSay('Voc� precisa de 10 Gold para alterar seu registro.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'konoha') or msgcontains(msg, 'konohagakure')) then
selfSay('Ok, deseja se tornar morador de Konoha ? {sim}', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 2160) >= 10) then
doPlayerRemoveItem(cid, 2160, 10)
doPlayerSetTown(cid, 2)
selfSay('Agora voc� reside em Konoha!', cid)
else
selfSay('Voc� precisa de 10 Gold para alterar seu registro.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())