local config = {

money = 60000000, -- Dinheiro que vai custar

item = 6536, -- ID do item que vai vender

count = 1, -- Quantidade

}


function onUse(cid, item, fromPosition, itemEx, toPosition)

pos = getCreaturePosition(cid)


if item.itemid == 1945 then

 if doPlayerRemoveMoney(cid, config.money) == TRUE then

doPlayerAddItem(cid, config.item, config.count)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Voc� acaba de comprar "..config.count.." "..getItemNameById(config.item)..".")

doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)

 else

doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Desculpe, mais voc� nao tem dinheiro suficiente.Custa 60kk")

doSendMagicEffect(pos, CONST_ME_POFF)

end

end


end