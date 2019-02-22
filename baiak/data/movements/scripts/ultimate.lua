-- Script Feito por Leandro Machado
function onStepIn(cid, item, position, fromPosition)
local config = {
msgDenied = "Você nao é Ultimate Para Ter Acesso fassa a quest ultimate!",
msgWelcome = "Bem Vindo a area Ultimate!"
}
if getPlayerStorageValue(cid, 13602) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end