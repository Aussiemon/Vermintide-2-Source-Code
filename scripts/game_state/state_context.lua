StateContext = StateContext or {}

StateContext.set_context = function (c)
	StateContext.context = c
end

StateContext.get = function (parent, child)
	assert(StateContext.context[parent], "parent does not exist")

	return StateContext.context[parent][child]
end

StateContext.manager = function (name)
	return StateContext.get("manager", name)
end

StateContext.event = function ()
	return StateContext.get("manager", "event")
end

return
