local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 15.3, -1000, 15.7, 0)

function onGetFormulaValues(cid, level, maglevel)
        min = (level * 2 + maglevel * 3) * 2.3 - 25
        max = (level * 2 + maglevel * 3) * 2.6
        
        if min < 10000 then
                min = 10000
        end

        return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
        return doCombat(cid, combat, var)
end