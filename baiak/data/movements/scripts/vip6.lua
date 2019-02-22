function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=155, y=52, z=7}





if isPlayer(cid) then

if item.actionid == 7525 then

vip = getPlayerStorageValue(cid,7525)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Mega Vip.Para Adquirir Mage vip faça a Quest Mega Vip!Localizada no Templo vip 5")


doTeleportThing(cid,teleport1)


else

end

end

end

end
