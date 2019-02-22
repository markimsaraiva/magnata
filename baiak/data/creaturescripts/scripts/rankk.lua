unction onKill(cid, target)

    setGlobalStorageValue(74675, getGlobalStorageValue(74675) == -1 and "" or getGlobalStorageValue(74675))
    if isMonster(target) then
        addRankPlayer("monsters", getCreatureName(cid), getPlayerLevelInRank("monsters", getCreatureName(cid))+1)
    end
    if isPlayer(target) then
        if getPlayerGuildId(cid) > 0 then
            if lastHit then
                if getPlayerGuildId(target) <= 0 or getPlayerGuildId(target) ~= getPlayerGuildId(cid) then
                   addRankPlayer("guilds", getPlayerGuildName(cid), getPlayerLevelInRank("guilds", getPlayerGuildName(cid))+1)
                end
            end
        end
    end
    return TRUE
end