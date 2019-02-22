local reasons = {[1] = 2, [2] = 5, [3] = 12, [4] = 19}

function isBanned(GUID)﻿
	local query = db.getResult("SELECT active FROM bans WHERE param = "..GUID)
	if query:getID() > -1 then
		repeat
			if query:getDataInt("active") == 1 then
				return true
			end
		until not query:next()
	end
	query:free()
	return false
end

function onSay(cid, words, param)
	if param:lower() == "reasons" then
		return doPlayerSendTextMessage(cid, 27, "1 - unsuitable name, 2 - spamming, 3 - use of unnoficial software, 4 - destructive behaviour.")
	end
	local param = string.explode(param, ',')	
	if words == "/ban" then		
		local adminid = getPlayerGUID(cid)
		local player_name = param[1]
		local days = type(tonumber(param[2])) == 'number' and tonumber(param[2]) * 24 * 3600 or false
		local comment = param[3]
		local reason = reasons[tonumber(param[4])] or 19
		if not param[1] then
			doPlayerSendTextMessage(cid, 27, "Command requires parameters: name, days, comment, reason.")
		elseif not getPlayerGUIDByName(player_name) then
			doPlayerSendTextMessage(cid, 27, "Invalid player.")
		elseif not days then
			doPlayerSendTextMessage(cid, 27, "Invalid number of days.")
		else
			if not comment then
				comment = "No comment was added"
			end
			local player_to_ban = getPlayerGUIDByName(player_name)
			if isBanned(player_to_ban) then
				return doPlayerSendTextMessage(cid, 27, "This player is already banned.")
			end
			local func = db.query or db.executeQuery
			if func('INSERT INTO bans (type, value, param, active, expires, added, admin_id, comment, reason, action) VALUES (3, 8, '..player_to_ban..', 1, '..os.time() + days..', '..os.time()..', '..adminid..', "'..comment..'", '..reason..', 2)') then
				doPlayerSendTextMessage(cid, 27, "Player "..player_name.." has been banned.")
				local kick = getCreatureByName(player_name)
				if kick then
					doRemoveCreature(kick)
				end
			else
				doPlayerSendTextMessage(cid, 27, "Error while banning.")
			end
		end
	elseif words == "/unban" then
		local player_name = param[1]
		local unban_player = getPlayerGUIDByName(player_name)
		if unban_player then
			local func = db.query or db.executeQuery
			if not isBanned(unban_player) then
				return doPlayerSendTextMessage(cid, 27, "Player is currently not banned.")
			end
			if func("UPDATE bans SET active = 0 WHERE param = "..unban_player) then
				doPlayerSendTextMessage(cid, 27, "Player "..player_name.." has been successfully unbanned.")
			else
				doPlayerSendTextMessage(cid, 27, "Error while unbanning.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "Invalid player name specified.")
		end
	end
	return true
end