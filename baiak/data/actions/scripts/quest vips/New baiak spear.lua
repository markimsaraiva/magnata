function onUse(cid, item, frompos, item2, topos)
if item.uid == 9051 then
queststatus = getPlayerStorageValue(cid,90060)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma New baiak spear!.")
doPlayerAddItem(cid,7367,1 )
setPlayerStorageValue(cid,90060,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 