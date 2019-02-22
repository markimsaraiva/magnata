local velocidade = 0000 -- 0 segundo
local color = 35
local color2 = 83
local color3 = 129
local color4 = 198
local color5 = 5
local color6 = 30
local color7 = 144
local color8 = 180
local color9 = 210
local function loop(valores)


doSendAnimatedText({x=159, y=49, z=7},"Tp's",color)


addEvent(loop, velocidade, valore) -- Não remova isso
end


function onUse(cid, item, frompos, item2, topos)
valore = {cid = cid, topos = topos}
addEvent(loop, velocidade, valore)
end
