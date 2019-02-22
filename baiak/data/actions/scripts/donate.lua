local SHOP = {
	[10001] = {
		reward = 9778,
		cost = 1,
		count = 1,
	},
	[10002] = {
		reward = 9776,
		cost = 1,
		count = 1,
	},
	[10003] = {
		reward = 9777,
		cost = 1,
		count = 1,
	},
	[10004] = {
		reward = 11113,
		cost = 10,
		count = 1,
	}
}
function doPlayerRemovePremiumPoints(cid, cost)
    return db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` - " .. cost .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end  

function doPlayerGetPremiumPoints(cid)
	return db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local t = SHOP[item.actionid]
	if t then
	local premium_points = doPlayerGetPremiumPoints(cid):getDataInt("premium_points")
		if(premium_points >= t.cost) then
			local id = doCreateItemEx(t.reward, t.count or 1)
			if(doPlayerAddItemEx(cid, id) ~= RETURNVALUE_NOERROR) then
				return doPlayerSendCancel(cid, "You cannot carry this item."), false
			end
			doPlayerRemovePremiumPoints(cid, t.cost)
			doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_BLUE)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have purchased " .. getItemName(t.reward) .. ".")
		else
			doPlayerSendCancel(cid, "You do not have enough premium points.")
		end
	end
	return true
end