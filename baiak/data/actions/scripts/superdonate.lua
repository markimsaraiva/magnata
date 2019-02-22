-- Script Feito Por Leandro Machado
function onUse(cid, item, fromPosition, itemEx, toPosition)
local config={
removeOnUse = "yes" -- remover quando usar ("yes" or "no")
}
local days = 999 -- coloque os dias que serão a VIP!
local daysvalue = days * 24 * 60 * 60
local storageplayer = getPlayerStorageValue(cid, 8789)
local timenow = os.time()
if getPlayerStorageValue(cid, 8789) - os.time() <= 0 then
time = timenow + daysvalue
else
time = storageplayer + daysvalue
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foram adicionados ".. days .." dias de super donate no seu character.")
setPlayerStorageValue(cid, 8789, time)
local quantity = math.floor((getPlayerStorageValue(cid, 8789) - timenow)/(24 * 60 * 60))
doSendMagicEffect(getPlayerPosition(cid), math.random(28,30))
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. quantity .." dias de VIP restantes.")
if (config.removeOnUse == "yes") then
doRemoveItem(item.uid, 1)
end
return TRUE
end