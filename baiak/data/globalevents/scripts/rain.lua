local rain = Rain:new()

function onThink(interval, lastExecution)
local minX = 155
local minY = 57
local maxX = 156
local maxY = 57

local frompos = {x=math.random(minX, maxX), y=math.random(minY, maxY), z=7}
local topos = {x=math.random(frompos.x, maxX), y=math.random(frompos.y, maxY), z=7}

local effects = {
snow = {
disteffect = CONST_ANI_SNOWBALL,
effect = CONST_ME_ICETORNADO
},
rain = {
disteffect = CONST_ANI_ICE,
effect = CONST_ME_LOSEENERGY
}
}
random = math.random(0, 10)
if (random == 0) then
rain.chance = math.random(10,50)
rain:start({fromPos = frompos, toPos = topos}, effects.snow, 300, math.random(100, 500))
else
rain.chance = math.random(20,100)
rain.createItem = {chance = math.random(0,10), item = {itemid = 2016, type = 1}}
rain:start({fromPos = frompos, toPos = topos}, effects.rain, math.random(100, 1000), math.random(100, 350))
end
return TRUE
end