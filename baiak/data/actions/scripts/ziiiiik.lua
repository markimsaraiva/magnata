-- Script By Th3uz1k ADM Th3uz1k --
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==7521 then
queststatus = getPlayerStorageValue(cid,7526)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"Voc� jah pegou sua recompensa.")
 
else
doPlayerSendTextMessage(cid,22,"Voce agora � um Vip7.")
doSendMagicEffect(topos,35)
coins_uid = doPlayerAddItem(cid,2160,100)
coins_uid = doPlayerAddItem(cid,9693,1)
setPlayerStorageValue(cid,7526,1)
end
return 0
end
return 1
end
