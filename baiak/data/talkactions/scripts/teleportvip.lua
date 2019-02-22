--[[Script By Vodkart]]--

function onSay(cid, words, param)

local config = {
pz = true, -- players precisam estar em protection zone para usar? (true or false)
battle = true, -- players deve estar sem battle (true or false)
custo = true, -- se os teleport irão custa (true or false)
need_level = true, -- se os teleport irão precisar de level (true or false)
premium = true -- se precisa ser premium account (true or false)
}

--[[ Config lugares]]--
local lugar = {
["depot"] = { -- nome do lugar
pos = {x=129, y=54, z=6},level = 5,price = 000},
["templo"] = { -- nome do lugar
pos = {x=165, y=52, z=7},level = 10, price = 000},
["arena"] = { -- nome do lugar
pos = {x=491, y=390, z=7},level = 15,price = 000},

}

--[[ Lista de Viagem (Não mexa) ]]--
if (param == "lista") then
local str = ""
str = str .. "lista de viagem :\n\n"
for name, pos in pairs(lugar) do
str = str..name.."\n"
end
str = str .. "" 
doShowTextDialog(cid, 6579, str)
return TRUE
end

 
local a = lugar[param]
if not(a) then
doPlayerSendTextMessage(cid, 22, "desculpe,este lugar não existe")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.pz == true and getTilePzInfo(getCreaturePosition(cid)) == FALSE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"você precisa estar em protection zone pra poder teleportar.")
return TRUE
elseif config.premium == true and not isPremium(cid) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Apenas players com premium account podem teleportar.")
return TRUE
elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa estar sem battler pra poder teleportar.")
return TRUE
elseif config.need_level == true and getPlayerLevel(cid) < a.level then
doPlayerSendTextMessage(cid, 22, "Desculpe,Voce não tem level. voce precisa "..a.level.." level ou mais para ser teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
elseif config.custo == true and doPlayerRemoveMoney(cid, a.price) == FALSE then
doPlayerSendTextMessage(cid, 22, "Desculpe,voce nao tem dinheiro suficiente. Voce precisa "..a.price.." gp para ser teleportado.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
end
doTeleportThing(cid, a.pos)
doSendMagicEffect(a.pos, CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid, 22, "" .. getPlayerName(cid) .. " foi teleportado para: \n " .. param .. ".")
return TRUE
end