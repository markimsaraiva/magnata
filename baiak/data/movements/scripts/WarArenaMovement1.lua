function onStepOut(cid, item, position, fromPosition)
    local team = (fromPosition.x == leaderteam1pos.x and fromPosition.y == leaderteam1pos.y and fromPosition.z == leaderteam1pos.z) and "team1" or (fromPosition.x == leaderteam2pos.x and fromPosition.y == leaderteam2pos.y and fromPosition.z == leaderteam2pos.z) and "team2"
    if team == "team1" then
        if getGlobalStorageValue(team1leverstorage) == 1 then
            setGlobalStorageValue(team1leverstorage, 0)
            doTransformItem(getThingFromPos(team1leverpos).uid, leverafter)
        end
    elseif team == "team2" then
        if getGlobalStorageValue(team2leverstorage) == 1 then
            setGlobalStorageValue(team2leverstorage, 0)
            doTransformItem(getThingFromPos(team2leverpos).uid, leverafter)
        end 
    end
end