function onUse(cid, item, frompos, item2, topos)
pos = {x=2384, y=1328, z=7}
if item.itemid == 4874 then

doPlayerSendCancel(cid,"God Math o melhor!")
doTeleportThing(cid,pos)
else

doPlayerSendCancel(cid,"Fail !")


end

return 1

end 