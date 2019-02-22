function onDeath(cid)
    setPlayerStorageValue(cid, storageplayersteam1, 0)   
    setGlobalStorageValue(storageteam1death, getGlobalStorageValue(storageteam1death) >= 0 and getGlobalStorageValue(storageteam1death)+1 or 1)
    if getGlobalStorageValue(storageteam1death) >= getGlobalStorageValue(storageteam1) then
        if onlyguildwars then
            doBroadcastMessage("The Team 2 won the war, guild " .. getPlayerGuildName(getGlobalStorageValue(storageleader2)) .. ".")
        else
            doBroadcastMessage("The Team 2 won the war, team leader name is " .. getCreatureName(getGlobalStorageValue(storageleader2)) .. ".")
        end
        setGlobalStorageValue(storageteam1death, 0)
        setGlobalStorageValue(storageteam2death, 0)
        setGlobalStorageValue(haveteaminarena, 0)
    end 
    return TRUE 
end