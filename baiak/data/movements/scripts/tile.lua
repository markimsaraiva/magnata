function onStepIn(cid, item, position, fromPosition)
		if getPlayerLevel(cid) >= 160 then
			doPlayerSendTextMessage(cid,22,"WELCOME!")
			doSendMagicEffect(getCreaturePosition(cid), 28)
		else
			doTeleportThing(cid, fromPosition)
			doPlayerSendTextMessage(cid,22,"Voce precisa ser level 160 ou superir para passar por este piso.")
			doSendMagicEffect(getCreaturePosition(cid), 2)
		end
return TRUE
end