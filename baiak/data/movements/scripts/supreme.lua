-- Script Feito por Leandro Machado
function onStepIn(cid, item, position, fromPosition)
local config = {
msgDenied = "Voc� nao e VIP SUPREME Para comprar V� Ate O NPC Supreme Seller!",
msgWelcome = "Bem Vindo a area VIP SUPREME!"
}
if getPlayerStorageValue(cid, 13600) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end