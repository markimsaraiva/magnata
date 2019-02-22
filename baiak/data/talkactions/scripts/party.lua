function onSay(cid, words, param, channel) --made in MG by Eskylo.
 if not isInParty(cid) or getPlayerParty(cid) ~= cid then
  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não é líder de uma party")
 end
 local outfit = getCreatureOutfit(cid)
 local addons = outfit.lookAddons
 for _, cid2 in ipairs(getPartyMembers(cid)) do
  outfit.lookAddons = 0
  doCreatureChangeOutfit(cid2, outfit)
  doPlayerSendTextMessage(cid2, MESSAGE_STATUS_CONSOLE_BLUE, "Outfit da party trocado.")
  if canPlayerWearOutfit(cid2, outfit.lookType, addons) then
   outfit.lookAddons = addons
   doCreatureChangeOutfit(cid2, outfit)
   return true
  elseif addons == 3 then
   outfit.lookAddons = (canPlayerWearOutfit(cid2, outfit.lookType, 1) and 1) or (canPlayerWearOutfit(cid2, outfit.lookType, 2) and 2) or 0
   doCreatureChangeOutfit(cid2, outfit)
  end
 end
 return true
end --made in MG by Eskylo -> xTibia.