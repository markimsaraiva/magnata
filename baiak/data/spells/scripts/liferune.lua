local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SLEEP))
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 4, 25, 2)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end