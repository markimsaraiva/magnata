local QueryList = {
['Level'] = {'`name`, `level` AS `score` FROM `players`', 'ORDER BY `experience` DESC'},
['Magic Level'] = {'`name`, `maglevel` AS `score` FROM `players`', 'ORDER BY `maglevel` DESC, `manaspent` DESC'},
--['Storage'] = {'`players`.`name` AS `name`, `value` AS `score` FROM `player_storage` LEFT JOIN `players` ON `player_storage`.`player_id` = `players`.`id`', 'AND `key` = 1550 ORDER BY `value` DESC'}
}

for i, skill in ipairs({'fist','club','sword','axe','dist','shielding','fishing'}) do
local index = (skill == 'dist' and 'Distance' or skill:gsub('^%l',string.upper)) .. (i < 6 and ' Fighting' or '')
QueryList[index] = {'`name`, `skill_' .. skill .. '` AS `score` FROM `players`','ORDER BY `skill_' .. skill .. '` DESC, `skill_' .. skill .. '_tries` DESC'}
end

function updateHighscores()
for skill, query in pairs(QueryList) do
local t, Query = {}, db.storeQuery('SELECT ' .. query[1] .. ' WHERE `deletion` = 0 AND `group_id` < 3 ' .. query[2] .. ' LIMIT 30;')
if Query ~= false then
repeat
table.insert(t, {result.getDataString(Query, 'name'), result.getDataInt(Query, 'score')})
until not result.next(Query)
result.free(Query)
setGlobalStorageValue(skill, t)
end
end
setGlobalStorageValue('highscores', os.time())
end

function onStartup()
updateHighscores()
end

function onThink(interval)
updateHighscores()
return true
end