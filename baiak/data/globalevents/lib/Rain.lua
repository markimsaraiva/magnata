-- Features:
-- chance = OBJECT.chance = INT
-- createItem = OBJECT.createItem = {chance = INT, item = {itemid = INT, type = INT}}


Rain = {ignoreIds = {4526}}

function Rain:new()
local obj = {}
setmetatable(obj, self)
self.__index = self
return obj
end
function Rain:getPositionInArea(fromPos, toPos)
self.positions = {}
for Y = fromPos.y, toPos.y do
for X = fromPos.x, toPos.x do
if (getTileThingByPos({x=X, y=Y, z=7, stackpos=0}).itemid ~= 0) then
if not (string.match(string.lower(getItemNameById(getTileThingByPos({x=X, y=Y, z=7, stackpos=0}).itemid)), "water")) then
table.insert(self.positions, {x=X, y=Y, z=Z})
end
end
end
end
return true
end

function Rain:doRain(position, disteffect, effect)
if (self.duraction ~= self.executed) then
local chance = self.chance or 100
if (math.random(0, 1000) <= chance) then
for Z = 0, 7 do
if (getTileThingByPos(({x = position.x, y = position.y, z = Z})).itemid ~= 0) then
doSendDistanceShoot({x = position.x - 7, y = position.y - 5, z = Z}, {x = position.x, y = position.y, z = Z}, disteffect)
doSendMagicEffect({x = position.x, y = position.y, z = Z}, effect)
if (self.createItem) then
if (math.random(0, 1000) <= self.createItem.chance) then
if (isInArray(self.ignoreIds, getTileThingByPos({x=X, y=Y, z=Z, stackpos=0}).itemid) == FALSE) then
local item = doCreateItem(self.createItem.item.itemid, self.createItem.item.type, {x=position.x, y=position.y, z=Z})
doDecayItem(item)
end
end
end
break
end
end
end
return true
else
return false
end
end

function Rain:start(positions, effects, duraction, delay, var)
self:getPositionInArea(positions.fromPos, positions.toPos)
if not (self.positions[1]) then
return false
end
self.delay = delay
self.var = var or self
self.effects = effects
self.duraction = duraction
self.executed = 0
addEvent(doCallback, self.delay, {var=self.var})
return true
end

function doCallback(p)
for _, v in pairs(p.var.positions) do
if not (p.var:doRain(v, p.var.effects.disteffect, p.var.effects.effect)) then
return true
end
end
addEvent(doCallback, p.var.delay, {var=p.var})
p.var.executed = p.var.executed+1
end