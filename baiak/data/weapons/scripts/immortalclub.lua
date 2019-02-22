function onUseWeapon(cid, var)
	local target = variantToNumber(var)
	local lvl = getPlayerLevel(cid)
	local skillType = SKILL_CLUB
	local skill = getPlayerSkillLevel(cid, skillType)

	local dmgMax = (lvl * 3.2) + (skill * 35)
	local dmgMin = dmgMax / 1.5
	local fireMax = lvl
	local fireMin = (lvl / 2)
	
	local playerTarget = getCreatureTarget(cid)

	if(target ~= 0) then

		ret = doTargetCombatHealth(cid, playerTarget, COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax, 0)
		fire = doTargetCombatHealth(cid, playerTarget, COMBAT_FIREDAMAGE, -fireMin, -fireMax, 0)
	end
	return ret, fire
end