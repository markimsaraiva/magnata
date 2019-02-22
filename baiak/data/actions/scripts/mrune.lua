function onUse(cid, item, frompos, item2, topos)
playerpos = {x=topos.x, y=topos.y, z=topos.z, stackpos=253} 
player = getThingfromPos(playerpos)
ml = getPlayerMagLevel(cid)
lvl = getPlayerLevel(cid)
formula = 8000
if item2.itemid == 1 and ml >= 2 then
doSendMagicEffect(playerpos,1)
doPlayerAddMana(player.uid,formula)
doPlayerSay(player.uid,"Ahhhhhh",2)
if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
end
end
if item2.itemid == 1 and ml <= 1 then
doSendMagicEffect(frompos,2)
doPlayerSendCancel(cid,"You dont Have Magic Level to use this rune.")
end
if item2.itemid >= 2 then
doPlayerSendCancel(cid,"You can only use this rune in you or in players.")
doSendMAgicEffect(frompos,2)
end
return 1
end