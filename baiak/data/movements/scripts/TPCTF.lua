function onStepIn(cid, item, pos)
local table = {
[30025] = {townid = 1 , nome = Baiak, pos = {x=155,y=52,z=7}},
[30234] = {townid = 14 , nome = Farmine, pos = {x=33005,y=31491,z=11}}
}
for k,v in pairs(table) do
if item.actionid == k and isPlayer(cid) then
doPlayerSetTown(cid, v.townid)
doTeleportThing(cid, v.pos)
doSendMagicEffect(getCreaturePosition(cid),12)
end
end
end
