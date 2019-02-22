-- bonus by bryaan

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7514 then
   		queststatus = getPlayerStorageValue(cid,7514)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce ganhou baiakzik set.")
   			doPlayerAddItem(cid,2160,100)
   			doPlayerAddItem(cid,9693,1)
                        doPlayerAddItem(cid,2538,1)
                        doPlayerAddItem(cid,2504,1)
                        doPlayerAddItem(cid,2474,1)
                        doPlayerAddItem(cid,2503,1)
                        setPlayerStorageValue(cid,7514,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Voce ja pegou o set")
   		end
      	else
		return 0
   	end

   	return 1
end
