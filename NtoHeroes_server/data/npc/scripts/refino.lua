local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {11255, 2448}, -- item1 item que ser� pedido e que ser� dado na primeira troca
}
local counts = {
          count1 = {6, 1}, -- count1 quantidade que ser� pedido e que ser� dado na primeira troca
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

           if msgcontains(msg, 'negociar') or msgcontains(msg, 'Negociar') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                             selfSay('Voc� acabou de trocar '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' por '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('Voc� precisa '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
                    end
          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())