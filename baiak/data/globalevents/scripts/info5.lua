function onThink(interval, lastExecution)
  -- Configuraçġes
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Duvidas - Help]]
}

  -- Fim de Configuraçġes

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end