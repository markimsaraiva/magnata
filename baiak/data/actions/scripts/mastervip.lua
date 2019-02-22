function onUse(cid, item, frompos, item2, topos)
if item.uid == 1516 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,1516)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Master Vip Helmet")
item_uid = doPlayerAddItem(cid,7458,1)
setPlayerStorageValue(cid,1516,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1517 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1517)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Armor")
item_uid = doPlayerAddItem(cid,7463,1)
setPlayerStorageValue(cid,1517,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1518 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,1518)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Legs")
item_uid = doPlayerAddItem(cid,7464,1)
setPlayerStorageValue(cid,1518,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1519 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,1519)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Boots")
item_uid = doPlayerAddItem(cid,7457,1)
setPlayerStorageValue(cid,1519,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

else
return 0
end
return 1
end