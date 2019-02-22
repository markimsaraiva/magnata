SkillWindow = {
[1337] = 'Local highscores at ' .. getConfigInfo('serverName'),
[1338] = 'Level', [1339] = 'Magic Level', [1340] = 'Shielding',
[1341] = 'Distance Fighting', [1342] = 'Sword Fighting', [1343] = 'Club Fighting',
[1344] = 'Axe Fighting', [1345] = 'Fist Fighting', [1346] = 'Fishing',
--[1347] = 'Storage'
}

highscores = ModalWindow(1337, SkillWindow[1337], 'Choose a category:')
for i, skill in ipairs({'Level','Magic','Shielding','Distance','Sword','Club','Axe','Fist','Fishing'}) do
highscores:addChoice(i, skill)
end
--highscores:addChoice(10, 'Storage')
highscores:addButton(1, 'Show')
highscores:addButton(2, 'Close')
highscores:addButton(3, 'Info')
highscores:setDefaultEnterButton(1)
highscores:setDefaultEscapeButton(2)
highscores:setPriority(true)

function string.diff(diff) --by Colandus and fixed by Cykotitan
local format = {
{'day', diff / 60 / 60 / 24},
{'hour', diff / 60 / 60 % 24},
{'minute', diff / 60 % 60},
{'second', diff % 60}
}

local out = {}
for k, t in ipairs(format) do
local v = math.floor(t[2])
if(v > 0) then
table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
end
end
local ret = table.concat(out)
if ret:len() < 16 and ret:find('second') then
local a, b = ret:find(' and ')
ret = ret:sub(b+1)
end
return ret
end

function string.abbr(first, final, limit)
local str = first .. final
if str:len() > limit then
str = first:sub(1, limit-(final:len())) .. final
end
return str
end

function sendSkillWindow(cid, windowId)
local highscore = ModalWindow(windowId, 'Ranking for ' .. SkillWindow[windowId], 'Scroll down for entire list')
for rank, score in ipairs(getGlobalStorageValue(SkillWindow[windowId])) do
highscore:addChoice(rank, string.abbr(rank .. '. ' .. score[1], '... ' .. score[2], 30))
end
highscore:addButton(1, 'Back')
highscore:addButton(2, 'Close')
highscore:addButton(3, 'Info')
highscore:setDefaultEscapeButton(2)
highscore:setPriority(true)
highscore:sendToPlayer(cid)
end

function onModalWindow(cid, modalWindowId, buttonId, choiceId)

if not SkillWindow[modalWindowId] then
return
end

if buttonId == 3 then
doPlayerPopupFYI(cid, 'Local highscores were last updated ' .. string.diff(os.time()-getGlobalStorageValue('highscores')) .. ' ago.')
elseif buttonId == 1 then
if modalWindowId == 1337 then
sendSkillWindow(cid, 1337+choiceId)
else
highscores:sendToPlayer(cid)
end
return
end

return unregisterCreatureEvent(cid, 'Highscores')
end