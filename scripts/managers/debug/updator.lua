Updator = class(Updator)
Updator.init = function (self)
	self._updators = {}
	self._updators_by_name = {}

	return 
end
Updator.update = function (self, dt)
	for _, func in pairs(self._updators) do
		func(dt)
	end

	for _, func in pairs(self._updators_by_name) do
		func(dt)
	end

	return 
end
Updator.add_updator = function (self, func, name)
	if name then
		self._updators_by_name[name] = func
	else
		local id = #self._updators + 1
		self._updators[id] = func

		return id
	end

	return 
end
Updator.remove_updator = function (self, id)
	self._updators[id] = nil

	return 
end
Updator.remove_updator_by_name = function (self, name)
	self._updators_by_name[name] = nil

	return 
end
Updator.clear_updators = function (self)
	table.clear(self._updators)

	return 
end

return 
