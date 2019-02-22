function onSay(cid, words, param)
 
    if ranks[param:lower()] then
        setGlobalStorageValue(ranks[param:lower()], getGlobalStorageValue(ranks[param:lower()]) == -1 and "" or getGlobalStorageValue(ranks[param:lower()]))
        doShowTextDialog(cid, 6500, getRank(param:lower(), 10))
    else
        return doPlayerSendCancel(cid, "Esse rank nao existe ou voce nao digitou corretamente.")
    end
    return TRUE             
end