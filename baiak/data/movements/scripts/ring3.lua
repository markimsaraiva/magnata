local t = {
    vocations = {1, 2, 5, 6},
    storage = 50780,
    mana = 20000
}

local condition1 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAXMANAPOINTS, t.mana)
 
local function StopSuperForm(cid)
    if (getPlayerStorageValue(cid, t.storage) == 1) then
         setPlayerStorageValue(cid, t.storage, 0)
         doRemoveCondition(cid, CONDITION_ATTRIBUTES)
    end
   return true
end
 

function onEquip(cid, item, slot)
    if isInArray(t.vocations, getPlayerVocation(cid)) then
         setPlayerStorageValue(cid, t.storage, 1)
         doAddCondition(cid, condition1)
    else
         doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Sua vocação não pode usar este item!')
       return false
    end
   return true
end
 

function onDeEquip(cid, item, slot)
     return StopSuperForm(cid)
end