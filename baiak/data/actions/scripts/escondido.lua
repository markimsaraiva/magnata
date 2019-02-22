function onUse(cid, item, frompos, item2, topos)

playerpos = getPlayerPosition(cid)
novapos = {x=122, y=53, z=7}

if item.itemid == 2719 then
getThingfromPos(playerpos)
doSendMagicEffect(playerpos,2)
doTeleportThing(cid,novapos)
doSendMagicEffect(novapos,10)
doPlayerSendTextMessage(cid,22, 'Voce Está Preso Mané KKK!! Bug Abuse Bye,Bye!')
end
return 1
end