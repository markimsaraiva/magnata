local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local Honor_Storage = 215548
function getHonorPoints(cid)
local Honor = getPlayerStorageValue(cid, Honor_Storage)
return Honor < 0 and 0 or Honor
end
local shopWindow = {}
local t = {
		  [6531] = {price = 20}, -- [id do item] e em price qnto honor points vai custar
		  [2653] = {price = 20},
		  [3983] = {price = 20},
		  [2128] = {price = 20},
		  [2486] = {price = 20},
		  [2488] = {price = 20},
		  [3982] = {price = 30}
		  }
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
		if  t[item] and getHonorPoints(cid) < t[item].price then
			 selfSay("you do not have "..t[item].price.." Honor Points", cid)
				 else
				doPlayerAddItem(cid, item)
				setPlayerStorageValue(cid, Honor_Storage, getPlayerStorageValue(cid, Honor_Storage) - t[item].price)
				selfSay("Here you item", cid)
		   end
		return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
						for var, ret in pairs(t) do
										table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
								end
						openShopWindow(cid, shopWindow, onBuy, onSell)
				end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())