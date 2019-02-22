local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 37)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 41)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.9, -50, -1.9,0)

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
