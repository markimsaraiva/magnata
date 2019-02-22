local cfg = {

	kina= {2446,2447, idsword}, 
	pala = 8849,7364,
	sorc = 2453,11238,
	drui = 2453,11238,

}

function onUse(cid, item)

	if getPlayerStorageValue(cid, 38493) ~= 1 then
		if getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
			doPlayerAddItem(cid, cfg.kina[1], 1)
			doPlayerAddItem(cid, cfg.kina[2], 1)
			doPlayerSendTextMessage(cid, 25, "Congratulations!!")
			doPlayerSetStorageValue(cid, 38493, 1)
		elseif getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
			doPlayerAddItem(cid, cfg.sorc, 1)
			doPlayerSendTextMessage(cid, 25, "Congratulations!!")
			doPlayerSetStorageValue(cid, 38493, 1)
		elseif getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
			doPlayerAddItem(cid, cfg.drui, 1)
			doPlayerSendTextMessage(cid, 25, "Congratulations!!")
			doPlayerSetStorageValue(cid, 38493, 1)
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
			doPlayerAddItem(cid, cfg.pala, 1)
			doPlayerSendTextMessage(cid, 25, "Congratulations!!")
			doPlayerSetStorageValue(cid, 38493, 1)
                end
	else
		doPlayerSendCancel(cid, "It's empty.")
	end

	return true
end