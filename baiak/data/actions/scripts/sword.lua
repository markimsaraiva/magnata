function onUse(cid, item, frompos, item2, topos)
if item.uid == 1636 then
queststatus = getPlayerStorageValue(cid,1636)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você pegou 1 Sword") -- a mensagen que ira aparecer quando vc pegar o item
item_uid = doPlayerAddItem(cid,2160,1) -- item_uid = doPlayerAddItem(cid,2160~id do item~,100~Quantidade~)
setPlayerStorageValue(cid,1636,1)
else
doPlayerSendTextMessage(cid,22,"Esta Vazio . Vc Ja Fes A Quest.") -- ira aprecer quando vc ja tiver pego e tentar dnv
end
else
return 0
end
return 1
end