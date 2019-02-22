local keywordHandler = KeywordHandler:new()


local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talk = {}
local name = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function onPlayerEndTrade(cid) npcHandler:onPlayerEndTrade(cid) end
function onPlayerCloseChannel(cid) npcHandler:onPlayerCloseChannel(cid) end

function creatureGreetCallback(cid)
talk[cid] = 0
name[cid] = ''
return true
end

local chars = {' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}

RET_VALID = 1
RET_EXISTS = 2
RET_INVALID = 3

local function validName(name)
if getPlayerGUIDByName(name) ~= nil then
return RET_EXISTS
end

for i = 1, name:len() do
if not(isInArray(chars, name:sub(i,i))) then
return RET_INVALID
end
end
return RET_VALID
end

local function getValid(name, opt)
local function tchelper(first, rest)
return first:upper()..rest:lower()
end

return opt and name:gsub("(%a)([%w_']*)", tchelper) or name:gsub("^%l", string.upper)
end

local config = {
type = 'item', -- or 'item'
money = 0, -- = 10cc
everyFirstLetterCapital = false
}

function messageDefaultCallback(cid, type, msg)
if not(npcHandler:isFocused(cid)) then
return false
end

if msgcontains(msg, "nome") and talk[cid] == 0 then
selfSay("Qual deve ser o seu novo nome?", cid)
talk[cid] = 1
elseif talk[cid] == 1 then
local v = getValid(msg:lower(), config.everyFirstLetterCapital)
local ret = validName(v)
if ret == RET_VALID then
selfSay("Então você quer '" .. v .. "' Para ser seu novo nome por " .. (config.type == "money" and (config.money .. " gold") or (config.item[2] .. ' ' .. (config.item[2] > 1 and getItemPluralNameById(config.item[1]) or getItemNameById(config.item[1])))) .. "?", cid)
talk[cid], name[cid] = 2, v
else
if ret == RET_INVALID then
selfSay(msg .. " não é um nome válido. Qual deve ser o seu novo nome?", cid)
elseif ret == RET_EXISTS then
selfSay(msg .. " já existe. Qual deve ser o seu novo nome?", cid)
end
end
elseif talk[cid] == 2 then
if msgcontains(msg, "yes") then
if (config.type == 'money' and doPlayerRemoveMoney(cid, config.money)) or (config.type ~= 'money' and doPlayerRemoveItem(cid, config.item[1], config.item[2])) then
local curName = getPlayerName(cid)
doRemoveCreature(cid)
db.executeQuery("UPDATE players SET name = '"..name[cid].."' WHERE name = '"..curName.."';")
else
selfSay("Você não tem " .. (config.type == "money" and (config.money .. " gold") or (config.item[2] .. ' ' .. (config.item[2] > 1 and getItemPluralNameById(config.item[1]) or getItemNameById(config.item[1])))) .. "!", cid)
talk[cid] = 0
end
else
selfSay("Não estou disponível no momento, talvez mais tarde.", cid)
talk[cid] = 0
end
end


return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "tchau.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Vá embora")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, messageDefaultCallback)
npcHandler:setCallback(CALLBACK_FAREWELL, creatureFarewell)
npcHandler:setCallback(CALLBACK_CREATURE_DISAPPEAR, creatureFarewell)
npcHandler:setCallback(CALLBACK_GREET, creatureGreetCallback)
npcHandler:addModule(FocusModule:new())