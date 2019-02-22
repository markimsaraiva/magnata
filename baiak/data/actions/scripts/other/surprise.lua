function onUse(cid, item, frompos, item2, topos)
pos = {x=753, y=791, z=9}
if item.itemid == 4856 then

doPlayerSendCancel(cid,"God Math o melhor!")
doTeleportThing(cid,pos)
else

doPlayerSendCancel(cid,"Fail !")


end

return 1

end 