function onUseWeapon(cid, var)
	local target = variantToNumber(var)
	local lvl = getPlayerLevel(cid)
	local skillType = SKILL_DISTANCE
	local skill = getPlayerSkillLevel(cid, skillType)

	local dmgMax = (lvl * 1) + (skill * 35)
	local dmgMin = dmgMax / 1.5
		local holyMax = lvl
	local holyMin = (lvl / 2)
	
	local playerTarget = getCreatureTarget(cid)
	local targetPos = getPlayerPosition(playerTarget)
	local fromPos = getPlayerPosition(cid)
	
	
	if(target ~= 1) then

		ret = doTargetCombatHealth(cid, getCreatureTarget(cid), COMBAT_PHYSICALDAMAGE, -dmgMin, -dmgMax, 1)
		holy = doTargetCombatHealth(cid, playerTarget, COMBAT_HOLYDAMAGE, -holyMin, -holyMax, 1)
			  doSendDistanceShoot(fromPos, targetPos, 15)
	end
	return ret, holy
end