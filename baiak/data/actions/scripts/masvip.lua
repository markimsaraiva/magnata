--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==15966 then
queststatus = getPlayerStorageValue(cid,15967)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"Você jah pegou sua recompensa.")
 
else
doPlayerSendTextMessage(cid,22,"Voce agora é um Master Vip. System Vip By {ADM}~Th3uz1k~.")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,2160,100)
coins_uid = doPlayerAddItem(cid,9693,1)
setPlayerStorageValue(cid,15967,1)
end
return 0
end
return 1
end
