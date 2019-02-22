local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 1)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 11)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -90000, 0, -90500)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end
