local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 41)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 28)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -4000, 0, -4400)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end
