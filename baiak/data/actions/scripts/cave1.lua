function onUse(cid, item, frompos, item2, topos)
	local config = {
	timeExhausted = 15, -- tempo em horas para poder usar o item novamente.
	timeForUse = 2, -- tempo em horas que o player poderá entrar na cave.
	exhausted = 456789,
	storage = 789456,
	toKnow = 123456,
	effect = 27, -- efeito que dará ao usar o item.
	}
	
	if getPlayerStorageValue(cid, config.exhausted) < os.time() then
		setPlayerStorageValue (cid, config.storage, config.timeForUse * 60 * 60 + os.time())
		setPlayerStorageValue (cid, config.exhausted, config.timeExhausted * 60 * 60 + os.time())
           doRemoveItem(item.uid,1)
		setPlayerStorageValue (cid, config.toKnow, 1)
		doSendMagicEffect (getThingPos(cid), config.effect)
		doPlayerSendTextMessage (cid, 19, "Voce Ganho Acesso A Cave Exclusiva Por 2 horas.")
	else
		doPlayerSendTextMessage (cid, 19, "Voce Ja Usou Esse Item. (Espere 15 horas Para Usar Denovo)")
	end
return true
end