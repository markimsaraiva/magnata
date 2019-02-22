------ Script By MatheusMkalo for Xtibia.com Users -------
local configs = {
cobrar = "sim", ------ Use sim ou nao para cobrar.
sovip = "sim",  ------ Se somente vip players poderam usar o comando
price = 0,   ------ Preço a pagar se o cobrar estiver ativado.
storage = 13540 ------ Storage Id da sua vip account caso for usar somente vips
}
function onSay(cid, words, param)
local nada = {" "}

         if table.isStrIn(param, nada) or param == "" then
            doPlayerSendCancel(cid,"Voce precisa falar alguma coisa.")    
         return TRUE
         end

         if configs.sovip == "sim" and getPlayerStorageValue(cid, tonumber(configs.storage)) <= 0 then
            doPlayerSendCancel(cid,"Você não é vip.")
         return TRUE
         end
         
         if configs.cobrar == "sim" and not doPlayerRemoveMoney(cid,tonumber(configs.price)) then
            doPlayerSendCancel(cid,"Você não tem dinheiro suficiente.")
         return TRUE
         end
         
         doBroadcastMessage(""..getCreatureName(cid).." ["..getPlayerLevel(cid).."]: " .. param .. "", MESSAGE_INFO_DESCR)
         return TRUE
end         