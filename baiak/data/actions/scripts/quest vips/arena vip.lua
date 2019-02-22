function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9525 then
   		queststatus = getPlayerStorageValue(cid,9523)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a New Baiakzi Staff.")
   			doPlayerAddItem(cid,7754,1)
   			setPlayerStorageValue(cid,9523,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 9526 then
   		queststatus = getPlayerStorageValue(cid,9523)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a new baiak sword.")
   			doPlayerAddItem(cid,7391,1)
   			setPlayerStorageValue(cid,9523,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 9527 then
   		queststatus = getPlayerStorageValue(cid,9523)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a New baiak spear.")
   			doPlayerAddItem(cid,7367,1)
   			setPlayerStorageValue(cid,9523,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 9528 then
   		queststatus = getPlayerStorageValue(cid,9523)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a New baiak mace.")
   			doPlayerAddItem(cid,7425,1)
   			setPlayerStorageValue(cid,9523,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 9529 then
   		queststatus = getPlayerStorageValue(cid,9523)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a New Baiak axe.")
   			doPlayerAddItem(cid,7456,1)
   			setPlayerStorageValue(cid,9523,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
