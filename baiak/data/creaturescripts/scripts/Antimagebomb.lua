local config = {
        max = 4,
        text = "Multi-Client or Magebomb is not allowed and max 4.",
        group_id = 1
}
 
local accepted_ip_list = ""
 
local function antiMC(p)
        if #getPlayersByIp(getPlayerIp(p.pid)) >= p.max then
                doRemoveCreature(p.pid)
        end
        return TRUE
end
 
function onLogin(cid)
        if getPlayerGroupId(cid) <= config.group_id then
                if isInArray(accepted_ip_list,getPlayerIp(cid)) == FALSE then
                        addEvent(antiMC, 1000, {pid = cid, max = config.max+1})
                        doPlayerPopupFYI(cid, config.text)
                end
        end
        return TRUE
end 