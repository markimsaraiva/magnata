function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Bem Vindo Ao Baiak Magnata: Alguns Comandos basicos Para Voce Usar
!q: Ve Quandos De Gold Voce Tem
!tp Temple: Leva Voce Ate O templo
!bp: Compra 1 Bp
/commands: Para Ver Mais Comandos ]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end