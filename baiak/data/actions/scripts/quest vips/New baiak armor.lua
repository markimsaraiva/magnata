function onUse(cid, item, frompos, item2, topos)
if item.uid == 9057 then
queststatus = getPlayerStorageValue(cid,90063)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Uma New baiak armor!.")
doPlayerAddItem(cid,8821,1 )
setPlayerStorageValue(cid,90063,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 