function onUse(cid, item, frompos, item2, topos)
if item.uid == 9059 then
queststatus = getPlayerStorageValue(cid,90065)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma vip Nove Stone!.")
doPlayerAddItem(cid,5809,1 )
setPlayerStorageValue(cid,90065,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 