local lever = {
[60001] = {10,10301},
[60002] = {10,10313},
[60003] = {10,8856},
[60004] = {10,11390},
[60005] = {6,11387},
[60006] = {5,7708},
[60007] = {2,11249},
[60008] = {4,11392},
[60009] = {6,11394},
[60010] = {10,2358},
[60011] = {10,6391},
[60012] = {10,6433},
[60013] = {5,2128},
[60014] = {5,2486},
[60015] = {5,2488},
[60016] = {5,6531},
[60017] = {5,2653},
[60018] = {5,3983}

}
local storage,exausted = 98762, 2
local Stackable = {10301,10313,8856,11390,11387,7708,11249,11392,11394,2358,6391,6433,2128,2486,2488,6531,2653,3983} -- coloque o ID aqui dos que só vem 1
function onUse(cid,item,fromPosition,itemEx,toPosition)
if getPoints(cid) < lever[item.actionid][1] then
return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você precisa de "..lever[item.actionid][1].." points.")
elseif getPlayerStorageValue(cid, storage) >= os.time() then
return doPlayerSendCancel(cid, "wait " .. getPlayerStorageValue(cid, storage) - os.time() .. " seconds to use this item again.")
end
doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and isInArray(Stackable, lever[item.actionid][2]) and 1 or 100)
removePoints(cid,lever[item.actionid][1])
setPlayerStorageValue(cid, storage, os.time()+exausted)
doPlayerSendTextMessage(cid,22,"Você comprou um Item Da Loja Fusio" .. getItemNameById(lever[item.actionid][2]))
doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
return true
end 