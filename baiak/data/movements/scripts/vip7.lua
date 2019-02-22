function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}





if isPlayer(cid) then

if item.actionid == 7526 then

vip = getPlayerStorageValue(cid,7526)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vip7.Para Adquirir Sua Vip7 Compre Um Vip7 Doll Na Vip6")


doTeleportThing(cid,teleport1)


else

end

end

end

end
