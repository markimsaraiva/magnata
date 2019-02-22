function onUse(cid, item, frompos, item2, topos)
	local skull = getCreatureSkullType(cid) 
	local bad_skulls = {SKULL_RED,SKULL_BLACK}	
	if getTileInfo(getThingPos(cid)).protection == false then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce nao pode remover o skull nesta area.")
	return false
			elseif isInArray(bad_skulls, skull) == true then
				doPlayerSetSkullEnd(cid, 0, skull)
				doRemoveItem(item.uid, 1)
				db.executeQuery('UPDATE `killers`, `player_killers` SET `killers`.`unjustified` = 0 WHERE `killers`.`unjustified` = 1 AND `player_killers`.`player_id` = ' .. getPlayerGUID(cid) .. ' AND `killers`.`id` = `player_killers`.`kill_id`')
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "seu skull foi removido!")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao esta red/black skull!")
			end
	return true
end