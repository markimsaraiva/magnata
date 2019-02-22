function onDeath(cid, corpse, killer)

local Ppos = {x=160, y=54, z=0} -- posicao para onde ele vai ir


local monstName = "Ghasty Dragon"  -- nome do monstro
                
                 if isMonster(cid) then
                        if string.lower(getCreatureName(cid)) == string.lower(monstName) then
                           doTeleportThing(killer[1], Ppos)
                        end   
                 end 
        return TRUE
end