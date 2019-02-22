function onSay(cid,words,param)
local msg,depot = "O Jogador "..getCreatureName(cid).." Foi para o Depot com !fly",{x=160,y=54,z=7}
if getTilePzInfo(getCreaturePosition(cid)) == TRUE then
doTeleportThing(cid,depot)
doSendMagicEffect(getPlayerPosition(cid), 33)
broadcastMessage(msg,22)
else
doPlayerSendCancel(cid,"Sorry only in protect zone")
end
return TRUE
end

