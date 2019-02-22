local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 10)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.3, -30, -1.8,0)

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
