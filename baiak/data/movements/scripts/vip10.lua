function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}


if isPlayer(cid) then

if item.actionid == 12500 then

vip = getPlayerStorageValue(cid,12500)
if vip == -1 then
doPlayerSendCancel(cid,"Esta �rea � exclusiva para players Vips10.Para Adquirir vip10 fa�a a Quest Vip9")


doTeleportThing(cid,teleport1)


else

end

end

end

end
