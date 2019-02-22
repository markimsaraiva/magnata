--- Script by esK~---
--- Notice System 0.1 Beta ---
function onLogin(cid, words, param)
file = io.open('doar.txt','r')
doar = file:read(-1)
doShowTextDialog(cid,7528,doar)
file:close()
end