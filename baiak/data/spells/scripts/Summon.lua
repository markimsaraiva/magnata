function onTargetTile(cid, position)
position.stackpos = 255
doConvinceCreature(cid, doCreateMonster("Anihilator Monster", position, false))
doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
return true
end
local arr = {
{0, 0, 0, 0, 0, 0 ,0},
{0, 0, 0, 1, 0, 0 ,0},
{0, 0, 1, 0, 1, 0 ,0},
{0, 1, 0, 2, 0, 1, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}
local area, combat = createCombatArea(arr), createCombatObject()
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end