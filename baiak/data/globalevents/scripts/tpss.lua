local config = {
    positions = {
["NPC "] = { x = 142, y = 47, z = 7 },
["Bp"] = { x = 214, y = 370, z = 7 },
["Bp!"] = { x = 213, y = 370, z = 7 },
["PVP"] = { x = 203, y = 380, z = 7 },
["Templo"] = { x = 213, y = 391, z = 7 },
["Templo!"] = { x = 214, y = 391, z = 7 },
["Leia!"] = { x = 187, y = 1222, z = 8 },
["VIP7"] = { x = 716, y = 24, z = 7 },
["VIP8"] = { x = 704, y = 33, z = 7 },
["VIP9"] = { x = 706, y = 33, z = 7 },
["VIP10"] = { x = 708, y = 33, z = 7 },
["VIP11"] = { x = 710, y = 33, z = 7 },
["VIP12"] = { x = 712, y = 33, z = 7 },
["VIP13"] = { x = 714, y = 33, z = 7 },
["VIP14"] = { x = 716, y = 33, z = 7 },
["VIP15"] = { x = 719, y = 29, z = 7 },
["VIP15 "] = { x = 719, y = 28, z = 7 },
["AREA"] = { x = 167, y = 53, z = 7 },
["DONATE"] = { x = 167, y = 54, z = 7 },
["ITENS"] = { x = 158, y = 46, z = 7 },
["SUPREME"] = { x = 159, y = 46, z = 7 },
  }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(210, 210))
    end
    
    return TRUE
end  