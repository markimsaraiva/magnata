function onStepIn(cid, item)
local pos = {x=160, y=54, z=7} -- Posição para onde o PLAYER sera teleportado
local gpos = {x=1018, y=1019, z=7} -- Posição para onde o GOD sera teleportado

if getPlayerGroupId(cid) == 6 then -- Grupo de quem podera passar no Trono
doPlayerSendTextMessage(cid, 22, "Você passou pelo seu trono!") -- Mensagem quando passar pelo trono
doTeleportThing(cid, gpos)
doSendMagicEffect(getCreaturePosition(cid), 17) -- Efeito Magico
else
doPlayerSendTextMessage(cid, 22, "Somente Utilizado pelo GOD.") -- Mensagem para quem nao podera passar pelo Trono
doTeleportThing(cid, pos)
doSendMagicEffect(getCreaturePosition(cid), 10) -- Efeito Magico
end
