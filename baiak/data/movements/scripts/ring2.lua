local storage = 50780


-- Config << --


local condition1 = createConditionObject(CONDITION_ATTRIBUTES)

setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)

setConditionParam(condition1, CONDITION_PARAM_STAT_MAXHITPOINTS, 15000)


local function StopSuperForm(cid)

if (getPlayerStorageValue(cid, storage) == 1) then

setPlayerStorageValue(cid, storage, 0)

doRemoveCondition(cid, CONDITION_ATTRIBUTES)

end

return TRUE

end



function onEquip(cid, item, slot)

setPlayerStorageValue(cid, storage, 1)

doAddCondition(cid, condition1)

return TRUE

end



function onDeEquip(cid, item, slot)

return StopSuperForm(cid)

end
