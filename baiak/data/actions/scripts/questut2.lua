function onUse(cid, item, frompos, item2, topos) -- N�o mecha.


storage = 938312 -- Storage a cada quest que for criada aumente um numero da storage pra qnd vc pegar o ba� de outra quest � aparecer que vc j� fez.
item = 2352 -- Id do item ira ganhar.
quantidade = 1 -- Quantidade ira ganhar.
level = 500 -- Level que precisa pra fazer.

	if getPlayerLevel(cid) >= level and getPlayerStorageValue(cid,storage) == -1 then -- N�o mecha.
doPlayerSendTextMessage(cid,25,"Voc� ganhou um Ultimate Area Item") -- Mensagem que aparecera quando ganhar o item.
doPlayerAddItem(cid, item, quantidade) -- N�o mecha.
setPlayerStorageValue(cid,storage,1) -- N�o mecha.

elseif getPlayerLevel(cid) <= level then -- N�o mecha
doPlayerSendTextMessage(cid,25,"Voc� precisa ser level 500 ou mais.") -- Mensagem que ira aparecer se o player tiver menos level que o necessario.

elseif getPlayerStorageValue(cid,storage) >= 1 then -- N�o mecha.
doPlayerSendTextMessage(cid,25,"Voc� j� fez est� quest") -- Quando tentar pegar mais de uma vez o ba�.
end
return true
end