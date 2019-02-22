function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}



if isPlayer(cid) then

if item.actionid == 7520 then

vip = getPlayerStorageValue(cid,7520)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Super Vip.Para Adquirir Super vip faça a Quest Super Vip!Localizada no Templo vip 4")


doTeleportThing(cid,teleport1)


else

end

end

end

end
