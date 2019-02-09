function getPlayerTemplePos(cid)
    local town = getPlayerTown(cid)
    local temple = getTownTemp﻿lePosition(town)
    return temple or false﻿
end    
banStorage = 918171623
banCount = 918171624
banReason = 918171625

function doBanPlayer(cid,days,reason)
    if reason ~= false and reason ~= nil and isPlayer(cid) then
        setPlayerStorageValue(cid,banReason,reason)
    end
    if days ~= false and days ~= nil and isPlayer(cid) then
        local bantime = ((days * 60 * 60 * 24) + os.time(t))
        setPlayerStorageValue(cid,banStorage,bantime)
        doRemoveCreature(cid)
        return true
    elseif isPlayer(cid) then
        setPlayerStorageValue(cid,banStorage,0)
        doRemoveCreature(cid)
        return true
    end
    return false
end

function isPlayerBanned(cid)
    if not isPlayer(cid) then
        return false
    elseif getPlayerStorageValue(cid,banStorage) == 0 then
        return true
    elseif getPlayerStorageValue(cid,banStorage) == -1 then
        return false
    elseif getPlayerStorageValue(cid,banStorage) >= os.time(t) then
        return true
    end
    return false
end

function doUnbanPlayer(name)
    if getPlayerGUIDByName(name) then
        pid = getPlayerGUIDByName(name)
    else
        return false
    end
    if getCreatureByName(name) then
        local cid = getCreatureByName(name)
        if isPlayer(cid) then
            doRemoveCreature(cid)
        end
    end
    if db.query("UPDATE `player_storage` SET `value`=-1 WHERE `player_id` = "..pid.." AND `key`="..banStorage..";") == true then
        db.query("UPDATE `player_storage` SET `value`=-1 WHERE `player_id` = "..pid.." AND `key`="..banCount..";")
        db.query("UPDATE `player_storage` SET `value`=-1 WHERE `player_id` = "..pid.." AND `key`="..banReason..";")
        return true
    end
    return false
end

function getPlayerBanReason(cid)
    if isPlayer(cid) then
        local reason = getPlayerStorageValue(cid,banReason)
        if reason == -1 then
            reason = ""
        end
        return reason
    end
    return false
end