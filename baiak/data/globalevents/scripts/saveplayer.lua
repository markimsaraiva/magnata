local configs = {
    players_db = {},
    save_delay = 5, -- Segundos
}

function savePlayer()
    if #configs.players_db > 0 then

        doPlayerSave(configs.players_db[1])
        table.remove(configs.players_db, 1)
        return addEvent(savePlayer, configs.save_delay * 1000)
    end
    return true
end

function onThink(interval)
    for _, cid in ipairs(getPlayersOnline()) do

        table.insert(configs.players_db, cid)
    end

    savePlayer()
    return true
end