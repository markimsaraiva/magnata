local config = {  
tempo = 15, -- Tempo em minutos  
storage = 20000, -- não mexa aqui  
teleport = {x=160, y=54, z=7} -- coordenadas do seu templo  
}  
  
function onStepIn(cid, item, frompos, topos)
if isPlayer(cid) == TRUE then 
if getPlayerStorageValue(cid, config.storage) <= 0 then  
kick1 = addEvent(setPlayerStorageValue, config.tempo*60*1000-1000, cid, config.storage, -1)  
kick2 = addEvent(doTeleportThing, config.tempo*60*1000-500, cid, config.teleport)  
kick = addEvent(doRemoveCreature, config.tempo*60*1000, cid)  
doPlayerSendTextMessage(cid, 22, "[Trainer]: Movimente-se a cada " .. config.tempo .. " minutos, caso contrário, seu char será deslogado.")  
setPlayerStorageValue(cid, config.storage, 1)  
end  
end
end  
  
function onStepOut(cid, item, frompos, topos)
if isPlayer(cid) == TRUE then 
if getPlayerStorageValue(cid, config.storage) >= 1 then  
setPlayerStorageValue(cid, config.storage, -1)  
doPlayerSendTextMessage(cid, 23, "System kick off!")  
stopEvent(kick)  
stopEvent(kick1)  
stopEvent(kick2)  
end  
end
end