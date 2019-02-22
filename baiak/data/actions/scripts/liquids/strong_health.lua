local MIN = 2000
local MAX = 4000
local EMPTY_POTION = 7634

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayer(itemEx.uid) == FALSE then
		return FALSE
	end

	if hasCondition(cid, CONDITION_EXHAUST_HEAL) == TRUE then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return TRUE
	end

	if((not(isKnight(itemEx.uid) or isPaladin(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 50) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "Only knights and paladins of level 50 or above may drink this fluid.", TALKTYPE_ORANGE_1)
		return TRUE
	end

	if doCreatureAddHealth(itemEx.uid, math.random(MIN, MAX)) == LUA_ERROR then
		return FALSE
	end

	doAddCondition(cid, exhaust)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Baiak-Rs", TALKTYPE_ORANGE_1)
	return TRUE
end