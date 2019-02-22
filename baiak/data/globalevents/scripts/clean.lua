function executeClean()
	doCleanMap()
	doBroadcastMessage("Clear")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("Baiakrs Vai ser limpo Por favo recolha seu items")
	addEvent(executeClean, 50000)
	return true
end
