function onUse(cid, item, frompos, item2, topos)
if item.uid == 9055 then
queststatus = getPlayerStorageValue(cid,90061)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma New baiak shield!.")
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma New baiak boots!.")
doPlayerAddItem(cid,2524,1 )
doPlayerAddItem(cid,7893,1 )
setPlayerStorageValue(cid,90061,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 