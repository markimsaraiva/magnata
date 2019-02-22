-- Script Feito por Leandro Machado
function onStepIn(cid, item, position, fromPosition)
local config = {
msgDenied = "Você não tem permissao para acessar essa area, adquira o super donate no site!",
msgWelcome = "Bem Vindo a area Super Donate!"
}
if getPlayerStorageValue(cid, 8789) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end