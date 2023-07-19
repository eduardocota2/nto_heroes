--- CRITICAL System by Night Wolf
   
  local config = {
   effectonuse = 5, -- efeito que sai
   levelscrit = 15,  --- leveis que ter�o
   storagecrit = 48910 -- storage que ser� verificado
   }
   
function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit then
	doRemoveItem(item.uid, 1)
	doSendMagicEffect(topos,config.effectonuse)
	setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+1)
	doPlayerPopupFYI(cid,"Voc� aumentou seu N�vel de Cr�tico para ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/"..config.levelscrit.."].")
	elseif getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit then
	doPlayerPopupFYI(cid,"Voc� atingiu o N�vel M�ximo (15).\n                     Parab�ns!")
    return 0
    end
return 1
end