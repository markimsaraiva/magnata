function onUse(cid, item, frompos, item2, topos)
if item.uid == 9056 then
queststatus = getPlayerStorageValue(cid,90062)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma Emerald Swordt!.")
doPlayerAddItem(cid,2496,1 )
setPlayerStorageValue(cid,90062,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 