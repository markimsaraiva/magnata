function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Novos Comandos:
!aol 20k - fas uma aol
!bless 80k - compra todas as bless
!removeskull 1kk - limpa os frags 
!reparar soft 10k - repara soft
!reparar firewalker 10k! - repara firewalker

Bom Jogo]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end