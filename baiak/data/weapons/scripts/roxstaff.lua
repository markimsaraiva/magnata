local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 51)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 41)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -2400, 0, -3000)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end