local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 37)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 35)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -4800, 0, -5400)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end
