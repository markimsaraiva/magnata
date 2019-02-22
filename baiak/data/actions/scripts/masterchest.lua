function onUse(cid, item, frompos, item2, topos)
if item.uid == 1751 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Star ")
item_uid = doPlayerAddItem(cid,2399,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1752 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Wand")
item_uid = doPlayerAddItem(cid,2436,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1753 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Sword")
item_uid = doPlayerAddItem(cid,2446,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1754 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Master Vip Axe")
item_uid = doPlayerAddItem(cid,2447,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1755 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Master Vip Arrow")
item_uid = doPlayerAddItem(cid,7364,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1756 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Rod")
item_uid = doPlayerAddItem(cid,7429,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1757 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1751)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Club")
item_uid = doPlayerAddItem(cid,7432,1)
setPlayerStorageValue(cid,1751,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1758 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1758)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Master Vip Crossbow")
item_uid = doPlayerAddItem(cid,8849,1)
setPlayerStorageValue(cid,1758,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

else
return 0
end
return 1
end