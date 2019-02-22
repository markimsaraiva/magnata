function onUse(cid, item, frompos, item2, topos)
if item.uid == 5251 then

getPlayerStorageValue(cid,3517)
doPlayerSendTextMessage(cid,22,"AI TO RICO AI TO RICO!.")
doPlayerAddItem(cid,2160,100)
setPlayerStorageValue(cid,3517,1)
else

doPlayerSendTextMessage(cid,22,"AI TO RICO AI TO RICO!")


end

return 1

end 