function onAdvance(cid, skill, oldLevel, newLevel)

    if skill == 0 then
        setGlobalStorageValue(74666, getGlobalStorageValue(74666) == -1 and "" or getGlobalStorageValue(74666))
        addRankPlayer("fist", getCreatureName(cid), newLevel)
    elseif skill == 1 then
        setGlobalStorageValue(74667, getGlobalStorageValue(74667) == -1 and "" or getGlobalStorageValue(74667))
        addRankPlayer("club", getCreatureName(cid), newLevel)
    elseif skill == 2 then
        setGlobalStorageValue(74668, getGlobalStorageValue(74668) == -1 and "" or getGlobalStorageValue(74668))
        addRankPlayer("sword", getCreatureName(cid), newLevel)
    elseif skill == 3 then
        setGlobalStorageValue(74669, getGlobalStorageValue(74669) == -1 and "" or getGlobalStorageValue(74669))
        addRankPlayer("axe", getCreatureName(cid), newLevel)
    elseif skill == 4 then
        setGlobalStorageValue(74670, getGlobalStorageValue(74670) == -1 and "" or getGlobalStorageValue(74670))
        addRankPlayer("distance", getCreatureName(cid), newLevel)
    elseif skill == 5 then
        setGlobalStorageValue(74671, getGlobalStorageValue(74671) == -1 and "" or getGlobalStorageValue(74671))
        addRankPlayer("shielding", getCreatureName(cid), newLevel)
    elseif skill == 6 then
        setGlobalStorageValue(74672, getGlobalStorageValue(74672) == -1 and "" or getGlobalStorageValue(74672))
        addRankPlayer("fishing", getCreatureName(cid), newLevel)
    elseif skill == 7 then
        setGlobalStorageValue(74673, getGlobalStorageValue(74673) == -1 and "" or getGlobalStorageValue(74673))
        addRankPlayer("magic", getCreatureName(cid), newLevel)
    elseif skill == 8 then
        setGlobalStorageValue(74674, getGlobalStorageValue(74674) == -1 and "" or getGlobalStorageValue(74674))
        addRankPlayer("level", getCreatureName(cid), newLevel)
    end   
return TRUE
end