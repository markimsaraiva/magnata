function onUse(cid, item, frompos, item2, topos)
if item.uid == 9058 then
queststatus = getPlayerStorageValue(cid,90064)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou Uma New baiak legs!.")
doPlayerAddItem(cid,9928,1 )
setPlayerStorageValue(cid,90064,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 