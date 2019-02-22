function onUse(cid, item, frompos, item2, topos)
local storage = 11549 -- n mexa
local exhausted = 5 -- tempo em segundos

if (getPlayerStorageValue(cid, storage) >= os.time()) then
return doPlayerSendCancel(cid, "Você tem que esperar " .. getPlayerStorageValue(cid, storage) - os.time() .. " segundos para usar novamente.")
end

local summons = getCreatureSummons(cid)

local pet = {
["Rotworm"] = {1,10},
["Minotaur"] = {11,15},
["Dwarf Soldier"] = {16,19},
["Minotaur Guard"] = {20,25},
["Dragon Hatchling"] = {26,32},
["Dragon"] = {33,45},
["Giant Spider"] = {46,55},
["Dragon Lord"] = {56,120},
["Grim Reaper"] = {121,160},
["Ghastly Dragon"] = {161,200},
["Undead Dragon"] = {201,1000}
}

for k,v in pairs(pet) do -- 1

if getPlayerLevel(cid) >= v[1] and getPlayerLevel(cid) < v[2] then -- 2
if (table.maxn(summons) < 1)then -- 3
x = doSummonCreature(k, getCreaturePosition(cid))
doConvinceCreature(cid, x)
doCreatureSay(cid, k ..", go!", TALKTYPE_ORANGE_1)
doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 2)
return true
end
end
end
if isCreature(cid) then -- 4
doRemoveCreature(getCreatureSummons(cid)[1])
doCreatureSay(cid,"Hey Brother Come back!!!", TALKTYPE_ORANGE_1)
setPlayerStorageValue(cid,storage,os.time()+exhausted)
return true
end
end