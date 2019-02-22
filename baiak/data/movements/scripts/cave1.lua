function onStepIn(cid, item, position, fromPosition)
	local config = {
	storage = 789456,
	from = {x = 162, y = 44, z = 3}, -- coordenada do canto superior esquerdo da �rea.
	to = {x = 150, y = 53, z = 3}, -- coordenada do canto inferior direito da �rea.
	maxPlayers = 50, -- quantos jogadores poder�o entrar na �rea ao mesmo tempo.
	pos = {x = 156, y = 49, z = 3}, -- para onde o jogador ser� teleportado.
	}
	
	local function getPlayersInArea(left, right)
		local playersInArea = {}
		for _, cid in ipairs(getPlayersOnline()) do
			if isInRange(getThingPos(cid), left, right) then
				table.insert(playersInArea, cid)
			end
		end
	return playersInArea
	end
	
	if isPlayer(cid) then
		if getPlayerStorageValue (cid, config.storage) < os.time() then
			doPlayerSendTextMessage(cid, 19, "Voce Nao Tem Acesso A Area SuperUP.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, fromPosition, true)
		else
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		end
	
		if table.getn(getPlayersInArea(config.from, config.to)) < config.maxPlayers and getPlayerStorageValue (cid, config.storage) > os.time() then
			doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
			doTeleportThing (cid, config.pos)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		elseif table.getn(getPlayersInArea(config.from, config.to)) >= config.maxPlayers and getPlayerStorageValue (cid, config.storage) > os.time() then
			doPlayerSendTextMessage (cid, 19, "MSG caso j� tenha o limite de jogadores dentro da �rea.")
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, fromPosition, true)
		end
	end
return true
end