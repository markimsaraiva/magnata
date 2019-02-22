local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.7, 0, -0.8, 0)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -1, 40, -1, 40)
setCombatCondition(combat, condition)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local paradelay = getConfigInfo('paralyzeDelay')
    if var.pos ~= nil and getThingFromPos(var.pos).uid > 0 then
		if exhaustion.check(getThingFromPos(var.pos).uid,1985) == false then
        return doCombat(cid, combat, var), exhaustion.set(getThingFromPos(var.pos).uid, 30030, paradelay/1000), doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		else
		time = math.ceil(exhaustion.get(getThingFromPos(var.pos).uid,1985) / 60)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This player is immune to paralyze for another "..time.." minutes.")
		return true
		end
	else
        return doCombat(cid, combat, var), doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
    end
end 