local function getTopLevelName() 
local name = ""
local query = db.getResult("SELECT `name`, `level` FROM `players` WHERE `group_id` < 2 ORDER BY `level` DESC LIMIT 1")
    if query:getID() == -1 then
        return name
    end

    name = query:getDataString("name")
    query:free()
    return name
end

local coin_id = 2157 -- Id do coin que o player vai ganhar!
local coins_count = 400 -- Quantidade de coins que vai ganhar!

function onKill(cid, target, lastHit)

	if isPlayer(target) then
	local top_player = getTopLevelName()
		if getCreatureName(target) == top_player then
			doBroadcastMessage("O player "..getCreatureName(cid).." matou o(a) "..top_player.." que atualmente é o TOP Level do jogo, e por isso ganhou "..coins_count.."x Coins!!", class)
			doPlayerAddItem(cid, coin_id, coins_count)
		end
	end

	return true
end