function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)

if isPlayer(cid) and getPlayerSkullType(cid) ~= SKULL_RED then

if (getPlayerSlotItem(cid, 2).itemid == 11387) then

		 doCreatureSetDropLoot(cid, false)	

		 doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)

return TRUE

end

end

return TRUE

end