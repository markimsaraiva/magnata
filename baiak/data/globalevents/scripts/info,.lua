function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = azul)
    local mensagens ={
[[Bem Vindo Ao Nosso OT: Membros Da Staff Nunca Pedirao sua senha!
Quer Comprar uma House mais o Player esta inativo? entao chega na frente e fale !eject
Bom Jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end