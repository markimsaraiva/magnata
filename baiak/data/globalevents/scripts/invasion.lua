local i = {
["15:30"] = {nome = "O Destemido Boss Mutated Pumpkin Esta Atacando o Templo", pos = {x=137, y=48, z=7}, monster = {"1 The Mutated Pumpkin"}},
["20:30"] = {nome = "O Destemido Pirata Ataca o Templo", pos = {x=137, y=48, z=7}, monster = {"1 Supreme Pirata"}},
}

function onThink(interval, lastExecution)
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " iníciou.")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end