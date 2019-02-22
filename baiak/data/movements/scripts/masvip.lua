function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}



if isPlayer(cid) then

if item.actionid == 15967 then

vip = getPlayerStorageValue(cid,15967)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Master Vip.Para Adquirir master vip faça a Quest Master Vip!Localizada no Templo vip 2")


doTeleportThing(cid,teleport1)


else

end

end

end

end
