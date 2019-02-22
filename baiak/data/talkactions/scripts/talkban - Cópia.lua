
-- [( Daniel Ziyak )] --
function onSay(cid, item, position, fromPosition)

local text1 = "Para de me chamar, nao dou free itens, level ou skill, voce sera banido em 1 Min!!!"
local tempo = {60*100}

            doSendMagicEffect(position, 2)
            doShowTextDialog(cid, 7529, text1)
            doAddBanishment(cid, 1)
            doRemoveCreature(cid, tempo)
        end
    return TRUE