function onSay(cid, words, param)
if(words == "!points") then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você tem "..getPoints(cid).." Points.")
elseif(words == "!rankpoints") then
local max_players,str = 20,""
str = "--[ RANK POINTS ]--\n\n"
query = db.getResult("SELECT `name`, `points` FROM `players` WHERE `points` > -1 AND `id` > 6 AND `group_id` < 2 ORDER BY `points` DESC, `name` ASC;")
if (query:getID() ~= -1) then k = 1 while true do
str = str .. "\n " .. k .. ". " .. query:getDataString("name") .. " - [" .. query:getDataInt("points") .. "]"
k = k + 1
if not(query:next()) or k > max_players then break end end query:free()end
if str ~= "" then doShowTextDialog(cid,6500, str) end
elseif(words == "/addpoints") then 
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",") 
if not t[1] or not t[2] then return TRUE,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.") end
local player = getPlayerByName(t[1]) 
local points = tonumber(t[2]) or 1
local pid = getPlayerByNameWildcard(t[1]) 
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then 
db.executeQuery("UPDATE players SET `points` = `points` + ".. points .." WHERE `name` = ".. db.escapeString(t[1]) ..";")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "você adicionou "..points.." Points do jogador "..t[1]) 
return true
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "você adicionou "..points.." Points do jogador "..t[1]) 
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram adicionados "..points.." Points no seu character.") 
addPoints(player,points)
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você agora tem "..getPoints(player).." Points.") 
end
elseif(words == "/delpoints") then
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",") 
if not t[1] or not t[2] then return TRUE,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.") end
local player = getPlayerByName(t[1]) 
local points = tonumber(t[2]) or 1 
local pid = getPlayerByNameWildcard(t[1]) 
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then 
db.executeQuery("UPDATE players SET `points` = `points` - ".. points .." WHERE `name` = ".. db.escapeString(t[1]) ..";")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "você removeu "..points.." Points do jogador "..t[1])
return true
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "você removeu "..points.." Points do jogador "..t[1]) 
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram removidos "..points.." Points do seu character.") 
removePoints(player,points)
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você agora tem "..getPoints(player).." Points.") 
end
elseif(words == "/setpoints") then
if getPlayerAccess(cid) == 5 then
local t = string.explode(param, ",") 
if not t[1] or not t[2] then return TRUE,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.") end
local player = getPlayerByName(t[1]) 
local points = t[2] 
local pid = getPlayerByNameWildcard(t[1]) 
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then 
return TRUE,doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player with this name doesn\'t exist or is offline.") end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Agora o jogador "..t[1].." tem "..points.." Points no seu character.") 
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "agora você tem "..points.." Points do seu character.") 
setPoints(player,points)
end
end
return TRUE
end