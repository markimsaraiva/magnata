function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}





if isPlayer(cid) then

if item.actionid == 7527 then

vip = getPlayerStorageValue(cid,7527)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vip8.Para Adquirir Vip8 Compre Um Vip8 Doll No Baiak-Zik Na Vip7")


doTeleportThing(cid,teleport1)


else

end

end

end

end
