battlefield = {
	storage = 201206300801,
	storage2 = 201206300802,
	tpPos = {x=160, y=55, z=7}, -- aonde aparecerá o teleport
    pos_team_1 = {x=439,y=339,z=4}, -- posição do team 1 (do lado direito)
    pos_team_2 = {x=406,y=340,z=4}, -- posição do team 2 (do lado esquerdo)
	spectors = {{x=415,y=349,z=4},{x=430,y=347,z=4},{x=415,y=330,z=4},{x=431,y=331,z=4}}, -- aonde aparecerá os espectadores (em volta do battlefield)
	team1Name = "Black Assassins",
    team2Name = "Red Barbarians",	
}

function doBroadCastBattle(type,msg)

for _, cid in pairs(getPlayersOnline()) do
	if getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then
		doPlayerSendTextMessage(cid,type,msg) 
	end 
end

return true 
end

function removeTp()

local t = getTileItemById(battlefield.tpPos, 11757)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(battlefield.tpPos, CONST_ME_POFF)
	end
	
end

function OpenWallBattle()

local x = true
local B  = {  
	[1] = {1056,{x=423, y=338, z=3, stackpos = 1}},  -- posição da barreira 
	[2] = {1056,{x=423, y=339, z=3, stackpos = 1}},  -- posição da barreira 
	[3] = {1056,{x=423, y=340, z=3, stackpos = 1}},	 -- posição da barreira 
	[4] = {1056,{x=423, y=341, z=3, stackpos = 1}}   -- posição da barreira 
	} 

for i = 1, #B do
	if getTileItemById(B[i][2], B[i][1]).uid == 0 then 
		x = false 
	end
	if x == true then
		doRemoveItem(getThingfromPos(B[i][2]).uid,1)
	else
		doCreateItem(B[i][1], 1, B[i][2]) 
	end
end

end

function getWinnersBattle(storage)

local team = storage == 1 and battlefield.team1Name or battlefield.team2Name

doBroadcastMessage("Players from team ".. team .." won the event battlefield,they received a Present Bag!")
setGlobalStorageValue(battlefield.storage, -1)
removeTp()
OpenWallBattle()

for _, cid in pairs(getPlayersOnline()) do
	if getPlayerStorageValue(cid, battlefield.storage2) ~= -1 then 
		doRemoveCondition(cid, CONDITION_OUTFIT)
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		if getPlayerStorageValue(cid, battlefield.storage2) == storage then
			doPlayerAddItem(cid,6497,2)
		end
		setPlayerStorageValue(cid, battlefield.storage2, -1)
	end
end

end