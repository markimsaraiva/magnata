function onEquip(cid, item, slot)

doTransformItem(item.uid, 7697, 1)

doPlayerSendTextMessage(cid, 22, 'Agora ganha 8x mais experiencia!')

doPlayerSetExperienceRate(cid, getConfigValue("rateExperience")*0.8)




return TRUE

end


function onDeEquip(cid, item, slot)

doTransformItem(item.uid, 7708, 1)

doPlayerSendTextMessage(cid, 22, 'Experiencia extra cancelada.')

doPlayerSetExperienceRate(cid, 1)



return TRUE

end