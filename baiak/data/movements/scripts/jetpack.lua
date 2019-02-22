local coinID = ITEM_GOLD_COIN
local delay = 200
local minimo = 100
local storage = 50780

local condition1 = createConditionObject(CONDITION_INFIGHT)
setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)

--------------------------------------------------------------------------------
local function StopFly(cid)
if (getPlayerStorageValue(cid, storage) == 1) then
setPlayerStorageValue(cid, storage, 0)
doRemoveCondition(cid, CONDITION_INFIGHT)
end
return TRUE
end

local function fly(cid, prevpos)
local pos = getThingPos(cid)
local newpos = getPlayerLookPos(cid)
if getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).itemid == 2365 then
if pos.x == prevpos.x and pos.y == prevpos.y and pos.z == prevpos.z then
newpos.stackpos = 253
if doTileQueryAdd(cid, newpos) == 1 and not (getTilePzInfo(newpos) or isCreature(getThingFromPos(newpos).uid)) then
doTeleportThing(cid, newpos, TRUE)
doSendMagicEffect(pos, 36)
end
end
return addEvent(fly, delay, cid, pos)
end
end

function onEquip(cid, item, slot)
if (getPlayerItemCount(cid, coinID) > minimo and getPlayerStorageValue(cid, storage) ~= 1) then
setPlayerStorageValue(cid, storage, 1)
doPlayerRemoveItem(cid, coinID, minimo)
addEvent(fly, delay, cid, getThingPos(cid))
doAddCondition(cid,condition1)
elseif (getPlayerStorageValue(cid, storage) == 1) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You cannot equip this now!")
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You do not have enough coins!")
end
return TRUE
end

function onDeEquip(cid, item, slot)
return StopFly(cid)
end