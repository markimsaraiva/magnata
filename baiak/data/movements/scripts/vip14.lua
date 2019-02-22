function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}


if isPlayer(cid) then

if item.actionid == 12504 then

vip = getPlayerStorageValue(cid,12504)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vips14.Para Adquirir vip14 faça a Quest Vip13")


doTeleportThing(cid,teleport1)


else

end

end

end

end
