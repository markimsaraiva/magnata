local config = {
toKnow = 123456,
storage = 789456,
pos = {x = 155, y = 52, z = 7}, -- para onde o jogador será teleportado caso o tempo tenha acabado.
}

function onKill(cid, target, lastHit)
	if getPlayerStorageValue (cid, config.toKnow) == 1 then
		if getPlayerStorageValue (cid, config.storage) < os.time () then
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doRemoveCreature (cid)
		end
	end
return true
end

function onLogin(cid)
	if getPlayerStorageValue (cid, config.toKnow) == 1 then
		if getPlayerStorageValue (cid, config.storage)  < os.time () then
			doTeleportThing (cid, config.pos)
			setPlayerStorageValue (cid, config.toKnow, 0)
		end
	end
return true
end