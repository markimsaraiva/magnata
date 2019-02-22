local config = {
    positions = {
["Especiais"] = { x = 177, y = 62, z = 7 },
[""] = { x = 143, y = 53, z = 7 },
["Druid"] = { x = 1436, y = 1219, z = 7 },
["Sorcerer"] = { x = 1429, y = 1224, z = 7 },
["Knight"] = { x = 1436, y = 1229, z = 7 },
["Paladin"] = { x = 1442, y = 1224, z = 7 },
["Mage"] = { x = 60, y = 445, z = 7 },
["Distance"] = { x = 70, y = 45, z = 7 },
["Club"] = { x = 60, y = 449, z = 7 },
["Sword"] = { x = 65, y = 449, z = 7 },
["Axe"] = { x = 70, y = 449, z = 7 },
["Quest"] = { x = 1158, y = 1277, z = 7 },

    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(211, 212))
    end
    
    return TRUE
end  