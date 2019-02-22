local positions = {
{texto = "Bem Vindo" , pos = {x = 155, y = 51, z = 7}, effect = 37},
}

function onThink(cid, interval, lastExecution)
   for _, pid in pairs(positions) do
      doSendAnimatedText(pid.pos, pid.texto, math.random(211, 212))
      doSendMagicEffect(pid.pos, pid.effect or 18)
   end
 return true
end