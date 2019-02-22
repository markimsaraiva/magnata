function onStepIn(cid, item, position, fromPosition)
    local team = isSqmFromArea(areateam1ext, areaplayersteam, fromPosition) and "team1" or isSqmFromArea(areateam2ext, areaplayersteam, fromPosition) and "team2"
    if team == "team1" then
        if getGlobalStorageValue(team1leverstorage) == 1 then
            if not haveQuantPlayersInArea(areateam1ext, areaplayersteam, needplayers) then
                setGlobalStorageValue(team1leverstorage, 0)
                doTransformItem(getThingFromPos(team1leverpos).uid, leverafter)
            end
        end
    elseif team == "team2" then
        if getGlobalStorageValue(team2leverstorage) == 1 then
            if not haveQuantPlayersInArea(areateam2ext, areaplayersteam, needplayers) then
                setGlobalStorageValue(team2leverstorage, 0)
                doTransformItem(getThingFromPos(team2leverpos).uid, leverafter)
            end
        end
    end
    if getGlobalStorageValue(team1leverstorage) == 1 then
        if checkPoses(fromPosition, posbenterteam1) then
            doTeleportThing(cid, fromPosition)
            return doPlayerSendCancel(cid, "You can't enter now.")
        end
    elseif getGlobalStorageValue(team2leverstorage) == 1 then
        if checkPoses(fromPosition, posbenterteam2) then
            doTeleportThing(cid, fromPosition)
            return doPlayerSendCancel(cid, "You can't enter now.")
        end
    end            
end