local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 65)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 26)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -6600, 0, -6900)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end
