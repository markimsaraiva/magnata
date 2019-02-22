local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_YALAHARIGHOST)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)
function onGetFormulaValues(cid, level)
local danoporlevel = 5
local min = -((level*danoporlevel)-500)
local max = -((level*danoporlevel)+2000)
return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end