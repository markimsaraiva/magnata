function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Eventos serao feitos semanalmente!]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end