-- Script Feito Por Leandro Machado
function onUse(cid, item, fromPosition, itemEx, toPosition)
local config={
removeOnUse = "yes" -- remover quando usar ("yes" or "no")
}
local days = 999 -- coloque os dias que serão a VIP!
local daysvalue = days * 24 * 60 * 60
local storageplayer = getPlayerStorageValue(cid, 18700)
local timenow = os.time()
if getPlayerStorageValue(cid, 18700) - os.time() <= 0 then
time = timenow + daysvalue
else
time = storageplayer + daysvalue
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foram adicionados ".. days .." dias de SuperUP no seu character.")
setPlayerStorageValue(cid, 18700, time)
local quantity = math.floor((getPlayerStorageValue(cid, 18700) - timenow)/(24 * 60 * 60))
doSendMagicEffect(getPlayerPosition(cid), math.random(28,30))
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. quantity .." dias de SuperUP restantes.")
if (config.removeOnUse == "yes") then
doRemoveItem(item.uid, 1)
end
return TRUE
end
