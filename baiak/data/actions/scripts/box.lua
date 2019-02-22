-----   Random Box By EddyHavoc   -----


function onUse(cid, item, frompos, item2, topos)

r1 = math.random(1,9)

if getPlayerLevel(cid) >= 8 then

if doPlayerRemoveItem(cid,6497,1) == TRUE then

if r1 == 1 then

doPlayerSendTextMessage(cid,22,"Você ganho um Double Exp Potion.")

doPlayerAddItem(cid,7440,1)

elseif r1 == 2 then

doPlayerSendTextMessage(cid,22,"Você ganhou 10kk.")

doPlayerAddItem(cid,2157,10)

elseif r1 == 3 then

doPlayerSendTextMessage(cid,22,"Você ganhou um Critical.")

doPlayerAddItem(cid,8303,1)

elseif r1 == 4 then

doPlayerSendTextMessage(cid,22,"Você ganhou uma Supreme Boots.")

doPlayerAddItem(cid,11113,1)

elseif r1 == 5 then

doPlayerSendTextMessage(cid,22,"Você ganhou uma Donate Boots.")

doPlayerAddItem(cid,2644,1)

elseif r1 == 6 then

doPlayerSendTextMessage(cid,22,"Você ganhou 50kk.")

doPlayerAddItem(cid,2157,50)

elseif r1 == 7 then

doPlayerSendTextMessage(cid,22,"Você ganhou uma 100kk.")

doPlayerAddItem(cid,2157,100)

elseif r1 == 8 then

doPlayerSendTextMessage(cid,22,"Você ganhou uma Stamina Refil.")

doPlayerAddItem(cid,2346,1)

elseif r1 == 9 then

doPlayerSendTextMessage(cid,22,"Você ganhou um Dodge.")

doPlayerAddItem(cid,8300,1)

end

end

end

end