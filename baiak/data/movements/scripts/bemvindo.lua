function onStepIn(cid, item, pos)


if isPlayer(cid) then

if item.actionid == 13079 then
doSendAnimatedText(pos,"Magnata",TEXTCOLOR_BLUE)
doSendMagicEffect(pos,48, 64)
else
return 0
end
return 1
end
end