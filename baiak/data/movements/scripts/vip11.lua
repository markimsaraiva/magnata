function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}


if isPlayer(cid) then

if item.actionid == 12501 then

vip = getPlayerStorageValue(cid,12501)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vips11.Para Adquirir vip11 faça a Quest Vip10")


doTeleportThing(cid,teleport1)


else

end

end

end

end
