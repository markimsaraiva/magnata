 -- { By: GOD Dreamer } --

local female = {lookType = 128, lookHead = 86, lookBody = 114, lookLegs = 114, lookFeet = 114, lookTypeEx = 114, lookAddons = 0} -- Outfit Female
local male = {lookType = 128, lookHead = 86, lookBody = 114, lookLegs = 114, lookFeet = 114, lookTypeEx = 114, lookAddons = 0} -- Outfit Male
  
function onStepIn(cid, item, pos) 
if isPlayer(cid) == TRUE then
if getPlayerSex(cid) == 0 then 
doCreatureChangeOutfit(cid, female)
else
doCreatureChangeOutfit(cid, male) 
end  
doSendMagicEffect(getThingPos(cid), 29) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.
doSendAnimatedText(getPlayerPosition(cid),"WAAR!", math.random(01,255)) -- Oque o Player vai Falar quando Mudar de Outfit. 
end 
return TRUE 
end