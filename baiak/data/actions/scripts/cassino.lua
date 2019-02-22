-- Cassino System by LucasHere
function onUse(cid, item, frompos, item2, topos)
  pos1 = {x=264, y=344, z=7, stackpos=1} --posição que vai cria os items
  pos2 = {x=265, y=344, z=7, stackpos=1}
  pos3 = {x=266, y=344, z=7, stackpos=1}
  local config = {
  moneyneed = 10000 -- dinheiro para jogar 
  }
  local premio = 2160 -- id do premio
  local premio_cont = 2 -- quantidade  do premio que vai ganhar

    function additem(cid,premio,premio_cont)
            doPlayerAddItem(cid, premio,premio_cont)
                      end
                       if item.itemid == 1945 and getPlayerMoney(cid) < config.moneyneed then
                       doPlayerSendCancel(cid,"Desculpe,voce não grana suficiente para jogar!")
                       return FALSE
                       end
                if item.itemid == 1945 and  math.random(0, 8) == 1 then
                doTransformItem(item.uid,1946)
                doPlayerRemoveMoney(cid,config.moneyneed) 
    doCreateItem(6556,1,pos1)
addEvent(doCreateItem, 1000, 6556, 1, pos2)
addEvent(doCreateItem, 2000, 6556, 1, pos3)
      addEvent(additem,2000,cid,premio,premio_cont)
                    return true
elseif item.itemid == 1945 and math.random(0, 8) == 2 then
doTransformItem(item.uid,1946)
        doPlayerRemoveMoney(cid,config.moneyneed)
    doCreateItem(6557,1,pos1)
addEvent(doCreateItem, 1000, 6557, 1, pos2)
 addEvent(doCreateItem, 2000, 6556, 1, pos3)
                          return true
     elseif item.itemid == 1945 and math.random(0, 8) == 3 then
     doTransformItem(item.uid,1946)
        doPlayerRemoveMoney(cid,config.moneyneed)
    doCreateItem(6557,1,pos1)
addEvent(doCreateItem, 1000, 6557, 1, pos2)
addEvent(doCreateItem, 2000, 6557, 1, pos3)
  addEvent(additem,2000,cid,premio,premio_cont)
                                  return true
                   elseif item.itemid == 1945 and math.random(0, 8) == 4 then
                   doTransformItem(item.uid,1946)
                        doPlayerRemoveMoney(cid,config.moneyneed)
addEvent(doCreateItem, 1000, 6556, 1, pos2)
addEvent(doCreateItem, 2000, 6556, 1, pos3)
    doCreateItem(6557,1,pos1)
    return true
                          elseif item.itemid == 1945 and math.random(0, 8) == 5 then
                   doTransformItem(item.uid,1946)
                        doPlayerRemoveMoney(cid,config.moneyneed)
addEvent(doCreateItem, 1000, 6557, 1, pos2)
addEvent(doCreateItem, 2000, 6556, 1, pos3)
    doCreateItem(6557,1,pos1)
    return true
                       elseif item.itemid == 1945 and math.random(0, 8) == 6 then
                   doTransformItem(item.uid,1946)
                        doPlayerRemoveMoney(cid,config.moneyneed)
addEvent(doCreateItem, 1000, 6556, 1, pos2)
addEvent(doCreateItem, 2000, 6557, 1, pos3)
    doCreateItem(6557,1,pos1)
        return true
                           elseif item.itemid == 1945 and math.random(0, 8) == 7 then
                   doTransformItem(item.uid,1946)
                        doPlayerRemoveMoney(cid,config.moneyneed)
addEvent(doCreateItem, 1000, 6557, 1, pos2)
addEvent(doCreateItem, 2000, 6556, 1, pos3)
    doCreateItem(6557,1,pos1)
    return true
                           elseif item.itemid == 1945 and math.random(0, 8) == 8 then
                   doTransformItem(item.uid,1946)
                        doPlayerRemoveMoney(cid,config.moneyneed)
addEvent(doCreateItem, 1000, 6556, 1, pos2)
addEvent(doCreateItem, 2000, 6557, 1, pos3)
    doCreateItem(6556,1,pos1)
    return true

end
                item0 = getThingfromPos(pos1)
                item1 = getThingfromPos(pos2)
                item2 = getThingfromPos(pos3)
                        if item.itemid == 1946 then
                doTransformItem(item.uid,1945)  
                if item0.itemid ~= 0 and item1.itemid ~= 0 and item2.itemid ~= 0 then
                        doRemoveItem(item0.uid,1)
                                        doRemoveItem(item1.uid,1)
                                doRemoveItem(item2.uid,1)
                end
        else
                doTransformItem(item.uid,1945)
        end
        return 1
end