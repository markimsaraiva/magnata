function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}


if isPlayer(cid) then

if item.actionid == 12502 then

vip = getPlayerStorageValue(cid,12502)
if vip == -1 then
doPlayerSendCancel(cid,"Esta �rea � exclusiva para players Vips12.Para Adquirir vip12 fa�a a Quest Vip11")


doTeleportThing(cid,teleport1)


else

end

end

end

end
