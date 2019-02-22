function onDeath(cid)    
    setPlayerStorageValue(cid, storageplayersteam2, 0)  
    setGlobalStorageValue(storageteam2death, getGlobalStorageValue(storageteam2death) >= 0 and getGlobalStorageValue(storageteam2death)+1 or 1)
    if getGlobalStorageValue(storageteam2death) >= getGlobalStorageValue(storageteam2) then
        if onlyguildwars then
            doBroadcastMessage("The Team 1 won the war, guild " .. getPlayerGuildName(getGlobalStorageValue(storageleader1)) .. ".")
        else
            doBroadcastMessage("The Team 1 won the war, team leader name is " .. getCreatureName(getGlobalStorageValue(storageleader1)) .. ".")
        end
        setGlobalStorageValue(storageteam1death, 0)
        setGlobalStorageValue(storageteam2death, 0)
        setGlobalStorageValue(haveteaminarena, 0)
    end
    return TRUE 
end