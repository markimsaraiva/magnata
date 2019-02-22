function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}



if isPlayer(cid) then

if item.actionid == 5722 then

vip = getPlayerStorageValue(cid,5722)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Baiakzik Vip.Para Adquirir Baiakzik vip faça a Quest Baiakzik Vip!Localizada no Templo vip 3")


doTeleportThing(cid,teleport1)


else

end

end

end

end
