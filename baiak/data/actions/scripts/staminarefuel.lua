function onUse(cid, item, fromPosition, itemEx, toPosition)
local cfg = {}
cfg.refuel = 42 * 60 * 1000
if(getPlayerStamina(cid) >= cfg.refuel) then
doPlayerSendCancel(cid, "Sua Stamina Ja Esta Cheia.")
elseif(not isPremium(cid)) then
doPlayerSendCancel(cid, "You must have a premium account.")
else
doPlayerSetStamina(cid, cfg.refuel)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sua Stamina Foi Restaurada.")
doRemoveItem(item.uid)
end
return true
end