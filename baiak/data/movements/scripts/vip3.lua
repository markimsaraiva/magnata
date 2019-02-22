function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}



if isPlayer(cid) then

if item.actionid == 5721 then

vip = getPlayerStorageValue(cid,5721)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vips4.Para Adquirir vip4 faza a quest baiakzik vip que fica localizada no templo vip3")


doTeleportThing(cid,teleport1)


else

end

end

end

end
