function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end

function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerBuyItem(cid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItem(cid, itemid, count, charges)
end

function doPlayerBuyItemContainer(cid, containerid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItemContainer(cid, containerid, itemid, count, charges)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if(not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigInfo('freePremium'))))
end

function getMonthDayEnding(day)
	if(day == "01" or day == "21" or day == "31") then
		return "st"
	elseif(day == "02" or day == "22") then
		return "nd"
	elseif(day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function isNumber(str)
	return tonumber(str) ~= nil
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function doPlayerWithdrawAllMoney(cid)
	return doPlayerWithdrawMoney(cid, getPlayerBalance(cid))
end

function doPlayerDepositAllMoney(cid)
	return doPlayerDepositMoney(cid, getPlayerMoney(cid))
end

function doPlayerTransferAllMoneyTo(cid, target)
	return doPlayerTransferMoneyTo(cid, target, getPlayerBalance(cid))
end

function playerExists(name)
	return getPlayerGUIDByName(name) ~= 0
end

function getTibiaTime()
	local minutes = getWorldTime()
	local hours = 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	return {hours = hours, minutes = minutes}
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if(not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time)
	local condition = createConditionObject(CONDITION_MUTED)
	setConditionParam(condition, CONDITION_PARAM_TICKS, time * 1000)
	return doAddCondition(cid, condition)
end

function getPlayerGroupName(cid)
	return getGroupInfo(getPlayerGroupId(cid)).name
end

function getPlayerVocationName(cid)
	return getVocationInfo(getPlayerVocation(cid)).name
end

function getPromotedVocation(vid)
	return getVocationInfo(vid).promotedVocation
end

function doPlayerRemovePremiumDays(cid, days)
	return doPlayerAddPremiumDays(cid, -days)
end

function getPlayerMasterPos(cid)
	return getTownTemplePosition(getPlayerTown(cid))
end

function getHouseOwner(houseId)
	return getHouseInfo(houseId).owner
end

function getHouseName(houseId)
	return getHouseInfo(houseId).name
end

function getHouseEntry(houseId)
	return getHouseInfo(houseId).entry
end

function getHouseRent(houseId)
	return getHouseInfo(houseId).rent
end

function getHousePrice(houseId)
	return getHouseInfo(houseId).price
end

function getHouseTown(houseId)
	return getHouseInfo(houseId).town
end

function getHouseTilesCount(houseId)
	return getHouseInfo(houseId).tiles
end

function getItemNameById(itemid)
	return getItemDescriptionsById(itemid).name
end

function getItemPluralNameById(itemid)
	return getItemDescriptionsById(itemid).plural
end

function getItemArticleById(itemid)
	return getItemDescriptionsById(itemid).article
end

function getItemName(uid)
	return getItemDescriptions(uid).name
end

function getItemPluralName(uid)
	return getItemDescriptions(uid).plural
end

function getItemArticle(uid)
	return getItemDescriptions(uid).article
end

function getItemText(uid)
	return getItemDescriptions(uid).text
end

function getItemSpecialDescription(uid)
	return getItemDescriptions(uid).special
end

function getItemWriter(uid)
	return getItemDescriptions(uid).writer
end

function getItemDate(uid)
	return getItemDescriptions(uid).date
end

function getTilePzInfo(pos)
	return getTileInfo(pos).protection
end

function getTileZoneInfo(pos)
	local tmp = getTileInfo(pos)
	if(tmp.pvp) then
		return 2
	end

	if(tmp.nopvp) then
		return 1
	end

	return 0
end

function doShutdown()
	return doSetGameState(GAMESTATE_SHUTDOWN)
end

function doSummonCreature(name, pos, displayError)
	local displayError, cid = displayError or true, doCreateMonster(name, pos, displayError)
	if(not cid) then
		cid = doCreateNpc(name, pos, displayError)
	end

	return cid
end

function getOnlinePlayers()
	local tmp = getPlayersOnline()
	local players = {}
	for i, cid in ipairs(tmp) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	if(not isPlayer(cid)) then
		return false
	end

	return getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE) or getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN)
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	return isCreature(cid) and cid >= AUTOID_NPCS
end

function doPlayerSetExperienceRate(cid, value)
	return doPlayerSetRate(cid, SKILL__LEVEL, value)
end

function doPlayerSetMagicRate(cid, value)
	return doPlayerSetRate(cid, SKILL__MAGLEVEL, value)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level = 0, getPlayerLevel(cid)
	if(amount > 0) then
		experience = getExperienceForLevel(level + amount) - (round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	for i = 1, amount do
		doPlayerAddSpentMana(cid, (getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid)) / getConfigInfo('rateMagic'))
	end
	return true
end  

function doPlayerAddSkill(cid, skill, amount, round)
	if(skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif(skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	return doPlayerAddSkillTry(cid, skill, (getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill)) / getConfigInfo('rateSkill'))
end

function getPartyLeader(cid)
	local party = getPartyMembers(cid)
	if(type(party) ~= 'table') then
		return 0
	end

	return party[1]
end

function isInParty(cid)
	return type(getPartyMembers(cid)) == 'table'
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doPlayerResetIdleTime(cid)
	return doPlayerSetIdleTime(cid, 0)
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if(type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	local players = getPlayersOnline()
	for _, pid in ipairs(players) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if(type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	local players = getPlayersOnline()
	for _, pid in ipairs(players) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function getBooleanFromString(input)
	local tmp = type(input)
	if(tmp == 'boolean') then
		return input
	end

	if(tmp == 'number') then
		return input > 0
	end

	local str = string.lower(tostring(input))
	return (str == "yes" or str == "true" or (tonumber(str) ~= nil and tonumber(str) > 0))
end

function doCopyItem(item, attributes)
	local attributes = attributes or false

	local ret = doCreateItemEx(item.itemid, item.type)
	if(attributes) then
		if(item.actionid > 0) then
			doItemSetAttribute(ret, "aid", item.actionid)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doRemoveThing(uid)
	if(isCreature(uid)) then
		return doRemoveCreature(uid)
	end

	return doRemoveItem(uid)
end

function setAttackFormula(combat, type, minl, maxl, minm, maxm, min, max)
	local min, max = min or 0, max or 0
	return setCombatFormula(combat, type, -1, 0, -1, 0, minl, maxl, minm, maxm, min, max)
end

function setHealingFormula(combat, type, minl, maxl, minm, maxm, min, max)
	local min, max = min or 0, max or 0
	return setCombatFormula(combat, type, 1, 0, 1, 0, minl, maxl, minm, maxm, min, max)
end

function doChangeTypeItem(uid, subtype)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local subtype = subtype or 1
	return doTransformItem(thing.uid, thing.itemid, subtype)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if(writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if(date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getFluidSourceType(itemid)
	local item = getItemInfo(itemid)
	return item and item.fluidSource or false
end

function getDepotId(uid)
	return getItemAttribute(uid, "depotid") or false
end

function getItemDescriptions(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item = getItemInfo(thing.itemid)
	return {
		name = getItemAttribute(uid, "name") or item.name,
		plural = getItemAttribute(uid, "pluralname") or item.plural,
		article = getItemAttribute(uid, "article") or item.article,
		special = getItemAttribute(uid, "description") or "",
		text = getItemAttribute(uid, "text") or "",
		writer = getItemAttribute(uid, "writer") or "",
		date = getItemAttribute(uid, "date") or 0
	}	
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if(not item) then
		return false
	end

	if(count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	--[[if(precision) then
		return weight
	end

	local t = string.explode(tostring(weight), ".")
	if(table.maxn(t) == 2) then
		return tonumber(t[1] .. "." .. string.sub(t[2], 1, 2))
	end]]--

	return weight
end

function getItemWeaponType(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	return getItemInfo(thing.itemid).weaponType
end

function getItemRWInfo(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item, flags = getItemInfo(thing.itemid), 0
	if(item.readable) then
		flags = 1
	end

	if(item.writable) then
		flags = flags + 2
	end

	return flags
end

function getItemLevelDoor(itemid)
	local item = getItemInfo(itemid)
	return item and item.levelDoor or false
end

function isItemStackable(itemid)
	local item = getItemInfo(itemid)
	return item and item.stackable or false
end

function isItemRune(itemid)
	local item = getItemInfo(itemid)
	return item and item.clientCharges or false
end

function isItemDoor(itemid)
	local item = getItemInfo(itemid)
	return item and item.type == 5 or false
end

function isItemContainer(itemid)
	local item = getItemInfo(itemid)
	return item and item.group == 2 or false
end

function isItemFluidContainer(itemid)
	local item = getItemInfo(itemid)
	return item and item.group == 12 or false
end

function isItemMovable(itemid)
	local item = getItemInfo(itemid)
	return item and item.movable or false
end

function isCorpse(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item = getItemInfo(thing.itemid)
	return item and item.corpseType ~= 0 or false
end

function getContainerCapById(itemid)
	local item = getItemInfo(itemid)
	if(not item or item.group ~= 2) then
		return false
	end

	return item.maxItems
end

function getMonsterAttackSpells(name)
	local monster = getMonsterInfo(name)
	return monster and monster.attacks or false
end

function getMonsterHealingSpells(name)
	local monster = getMonsterInfo(name)
	return monster and monster.defenses or false
end

function getMonsterLootList(name)
	local monster = getMonsterInfo(name)
	return monster and monster.loot or false
end

function getMonsterSummonList(name)
	local monster = getMonsterInfo(name)
	return monster and monster.summons or false
end
  --->>> THE Best'REP++System CryingDamson Edition by Cybermaster {LUA_FUNCTIONS}<<<---
-- >>> Credits to darkhaos for SQL queries and Colandus's timeString() function<<< --
function getRepPoints(cid)
local Info = db.getResult("SELECT `rep` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
    local p = Info:getDataInt("rep")
    Info:free()
    return p
end

function getRepRank(points) --reduced by colandus :]
local ranks = {
    {-5000, "Power Abuser (***==========)"},
    {-2000, "Evil (=**==========)"},
    {-1500, "Gangster (==*==========)"},
    {-1000, "Villain (===|=========)"},
    {-500, "PK (====|========)"},
    {-300, "Bad Guy (======|======)"},
    {-299, "Noob (======|======)"},
    {300, "Well-Known (=======|=====)"},
    {500, "Popular (========|====)"},
    {1000, "Hailed (=========|===)"},
    {1500, "The Best (==========+==)"},
    {2000, "Hero (==========++=)"},
    {5000, "Legendary Hero (==========+++)"}
              }
table.sort(ranks, function(a, b) return a[1] > b[1] end)
    for _, t in ipairs(ranks) do    
        if(points >= t[1]) then
            return t[2]
        end
    end
    return ranks[1][2]
end

function setPlayerRep(cid, points)
    db.executeQuery("UPDATE `players` SET `rep` = " .. points .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
end

function addPlayerRep(cid, amount, color)
        db.executeQuery("UPDATE `players` SET `rep` = `rep` + " .. amount .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
        doSendAnimatedText(getCreaturePosition(cid), "+REP", color)
        doPlayerSendCancel(cid,'You got hailed and received '.. amount ..' rep points.')
end

function removePlayerRep(cid, amount, color)
    db.executeQuery("UPDATE `players` SET `rep` = `rep` - " .. amount .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
        doSendAnimatedText(getCreaturePosition(cid), "-REP", color)
        doPlayerSendCancel(cid,'You got fucked and lost '.. amount ..' rep points.')    
end

function repTime(timeDiff) --configured for 6 hours, pm me if you dont know how to change it
    local dateFormat = {    
        --{"day", timeDiff / 60 / 60 / 24 % 7},
                {"hour", timeDiff / 60 / 60 % 6},
        {"minute", timeDiff / 60 % 60},
        {"second", timeDiff % 60}
    }

    local out = {}
    for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
   
    return table.concat(out)
end

---------------||||||||||||END||||||||||||----------------- 
function getPlayerPassword(cid)
local AccInfo = db.getResult("SELECT `password` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. " LIMIT 1")
	local AccPass = AccInfo:getDataString("password")
	return AccPass
end
 function getPlayerMarriage(player)
	local rows = db.getResult("SELECT `marriage` FROM `players` WHERE `id` = " .. player .. ";")
	local marry = rows:getDataInt("marriage")
	if marry ~= 0 then
		return marry
	else
		return FALSE
	end
end

function addMarryStatus(player,partner)
	db.executeQuery("UPDATE `players` SET `marrystatus` = " .. partner .. " WHERE `id` = " .. player .. ";")
	return TRUE
end

function doCancelMarryStatus(player)
	db.executeQuery("UPDATE `players` SET `marrystatus` = 0 WHERE `id` = " .. player .. ";")
	return TRUE
end

function getMarryStatus(player)
	local stat = db.getResult("SELECT `id` FROM `players` WHERE `marrystatus` = " .. player .. ";")
	if(stat:getID() == -1) then
		return FALSE
	else
		local info = stat:getDataInt("id")
		return info
	end
end

function getOwnMarryStatus(player)
	local stat = db.getResult("SELECT `marrystatus` FROM `players` WHERE `id` = " .. player .. ";")
	if(stat:getID() == -1) then
		return FALSE
	else
		local info = stat:getDataInt("marrystatus")
		return info
	end
end

function isOnline(player)
	local rows = db.getResult("SELECT `online` FROM `players` WHERE `id` = " .. player .. ";")
	local on = rows:getDataInt("online")
	if on ~= 0 then
		return TRUE
	else
		return FALSE
	end
end
function getItemAttack(uid)
    return getItemAttribute(uid, "attackspeed")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "name")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "plural")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "attack")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "extraattack")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "defense")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "armor")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "extradefense")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "hitchance")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "range")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "actionid")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "action")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "aid")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "description")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "desc")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "protection")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "charges")
end
function getItemAttack(uid)
    return getItemAttribute(uid, "count")
end

function getPoints(cid)
local check = db.getResult("SELECT `points` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
return check:getDataInt("points") <= 0 and 0 or check:getDataInt("points") end
function addPoints(cid,amount)
db.executeQuery("UPDATE `players` SET `points` = "..getPoints(cid).."+"..amount.." WHERE `id` = "..getPlayerGUID(cid)) end
function removePoints(cid,amount)
db.executeQuery("UPDATE `players` SET `points` = "..getPoints(cid).."-"..amount.." WHERE `id` = "..getPlayerGUID(cid)) end
function setPoints(cid,value)
db.executeQuery("UPDATE `players` SET `points` = "..value.." WHERE `id` = "..getPlayerGUID(cid)) end

function getPlayerFrags(cid)
    local time = os.time()
    local times = {today = (time - 86400), week = (time - (7 * 86400))}
    local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
    if(result:getID() ~= -1) then
            repeat
                    local content = {date = result:getDataInt("date")}
                    if(content.date > times.today) then
                            table.insert(contents.day, content)
                    elseif(content.date > times.week) then
                            table.insert(contents.week, content)
                    else
                            table.insert(contents.month, content)
                    end
            until not result:next()
            result:free()
    end
    local size = {day = table.maxn(contents.day),week = table.maxn(contents.week),month = table.maxn(contents.month)}
    return size.day + size.week + size.month
end

function setFrags(cid)
if not isCreature(cid) then return LUA_ERROR end
setPlayerStorageValue(cid, 824544, getPlayerFrags(cid))
return doPlayerSave(cid)
end

function CountGuildMembers(GuildName) -- function by vodkart
local count = 0
local lista = db.getResult("SELECT `name`, `rank_id` FROM `players` WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = " .. getGuildId(GuildName) .. ");")  
if(lista:getID() ~= -1) then  
repeat  count = count + 1 until not lista:next()  lista:free() return count end
end