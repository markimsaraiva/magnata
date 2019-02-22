function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 20000) == TRUE then
local bp = doPlayerAddItem(cid, 2173, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "FDP AGR ROUBA MEU LOOT VEM ROUBA GO X1?", TALKTYPE_ORANGE_1)
else
doCreatureSay(cid, "VSF SEU FDP SEU MARMANJO ARRANJA VERGONHA NA CARA E VAI TRABALHAR OU MATAR NOOBS PRA PEGAR GRANA", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end