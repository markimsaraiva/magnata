	local config = {
    positions = {
["Time 1"] = { x = 1404, y = 1320, z = 7 },
["Time 2"] = { x = 1412, y = 1320, z = 7 },
   
  }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(211, 212))
    end
    
    return TRUE
end  