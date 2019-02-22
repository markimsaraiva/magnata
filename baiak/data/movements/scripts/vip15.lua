function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}


if isPlayer(cid) then

if item.actionid == 12505 then

vip = getPlayerStorageValue(cid,12505)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vips15.Para Adquirir vip15 faça a Quest Vip14")


doTeleportThing(cid,teleport1)


else

end

end

end

end
