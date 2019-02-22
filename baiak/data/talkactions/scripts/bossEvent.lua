local t = {
    msgActive = "Preparem-se Magnatas, The Boss esta vindo para destruir a cidade.",
    msgSpawn = "Rapido, o boss esta em posicao para atacar, protejam a cidade.",
    coolDown = 5,                    -- Tempo para nascer após usar o comando.
    boss = "TheBoss",                    -- Nome do boss.
    pos = {x = 373, y = 20, z = 7}   -- Posição em que o boss irá nascer.
}

function onSay(cid, words)
    local function summonBoss()
	doSendMagicEffect(t.pos, CONST_ME_TELEPORT)
        doCreateMonster(t.boss, t.pos)
        doBroadcastMessage(t.msgSpawn)
    end

    doBroadcastMessage(t.msgActive)
    addEvent(summonBoss, t.coolDown * 60)

   return true
   
end