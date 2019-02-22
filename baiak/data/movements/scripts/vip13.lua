function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}


if isPlayer(cid) then

if item.actionid == 12503 then

vip = getPlayerStorageValue(cid,12503)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vips13.Para Adquirir vip13 faça a Quest Vip12")


doTeleportThing(cid,teleport1)


else

end

end

end

end
