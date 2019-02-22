function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, storageplayersteam1) >= 1 then
        setPlayerStorageValue(cid, storageplayersteam1, 0)  
        doTeleportThing(cid, posbenterteam1)  
        setGlobalStorageValue(storageteam1death, getGlobalStorageValue(storageteam1death) >= 0 and getGlobalStorageValue(storageteam1death)+1 or 1)
        if getGlobalStorageValue(haveteaminarena) >=  1 then
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
        end
    elseif getPlayerStorageValue(cid, storageplayersteam2) >= 1 then
    setPlayerStorageValue(cid, storageplayersteam2, 0)  
        doTeleportThing(cid, posbenterteam2)
        setGlobalStorageValue(storageteam2death, getGlobalStorageValue(storageteam2death) >= 0 and getGlobalStorageValue(storageteam2death)+1 or 1)
        if getGlobalStorageValue(haveteaminarena) >=  1 then
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
        end
    end
    return TRUE             
end