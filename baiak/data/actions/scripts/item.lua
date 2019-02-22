local config = {
animationColor = TEXTCOLOR_LIGHTBLUE, --[[Cor da animação | Padrão = Azul Claro]]
textType = TALKTYPE_ORANGE_1, --[[Cor do Texto | Padrão = Verde]]
expGain = 9999999999 -- quanto vai ganhar de exp
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
doPlayerAddExp(cid, config.expGain)
doSendAnimatedText(getThingPosition(cid), config.expGain, config.animationColor)
doPlayerSendTextMessage(cid, config.textType, "Voce recebeu ".. config.expGain .." experience")
doRemoveItem(item.uid, 1)
return TRUE
end