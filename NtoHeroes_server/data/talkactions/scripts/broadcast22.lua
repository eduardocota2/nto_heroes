local config = {
storage = 19401, -- storage em que ser� salvo o tempo
cor = "advance", -- de acordo com o constant.lua da lib
tempo = 2, -- em minutos
price = 50000, -- pre�o pra usar o broadcast
level = 30 -- level pra poder utilizar o broadcast
}


function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end


if getPlayerLevel(cid) >= config.level then
if getPlayerStorageValue(cid, config.storage) - os.time() <= 0 then
if doPlayerRemoveMoney(cid, config.price) then
--setPlayerStorageValue(cid, config.storage, os.time() + (config.tempo*60)) 
doBroadcastMessage(""..getCreatureName(cid)..": "..param.."", config.cor)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Voc� acabou de enviar uma mensagem global, agora precisa aguardar " ..config.tempo.. " para enviar novamente.")
return false
else
doPlayerSendCancel(cid, "Voc� precisa de 5 gold's para enviar um global.")
return false
end
else
doPlayerSendCancel(cid, "Voc� precisa aguardar" ..(getPlayerStorageValue(cid, config.storage) - os.time()).. " segundos para enviar um global novamente.")
return false
end
else
doPlayerSendCancel(cid, "Voc� precisa de level " ..config.level.. " ou mais para usar um global.")
end
end