function onStepIn(cid, item, position, fromPosition)
		setPlayerStorageValue(cid, 8205, os.time () + 1)  -- 5 = 5 segundos
		doCreatureSay(cid, "Hupp!", TALKTYPE_MONSTER)
end
